import os
import datetime
import requests
import pandas as pd
import xml.etree.ElementTree as ET
import cx_Oracle
import schedule
import time

# 저장할 디렉터리 설정
save_dir = '저장할공간'
os.makedirs(save_dir, exist_ok=True) # 디렉토리 없으면 생성

# API 기본 설정
api_key = '온라인청년센터 API 값' # API값 입력
base_url = 'https://www.youthcenter.go.kr/opi/youthPlcyList.do' # 요청 URL

# 정책분야코드 리스트
policy_codes = {
    '일자리': '023010',
    '주거': '023020',
    '교육': '023030',
    '복지.문화': '023040',
    '참여.권리': '023050'
}

# 요청 파라미터 설정
params = {
    'openApiVlak': api_key,
    'display': 100,
    'pageIndex': 1
}

# 모든 데이터를 저장할 리스트
all_data = []

# XML 파싱 함수
def parse_xml(xml_string):
    root = ET.fromstring(xml_string)
    data_list = []
    for policy in root.findall('youthPolicy'):
        data = {
            'policy_id': policy.find('bizId').text if policy.find('bizId') is not None else '',
            'org_code': policy.find('polyBizSecd').text if policy.find('polyBizSecd') is not None else '',
            'policy_name': policy.find('polyBizSjnm').text if policy.find('polyBizSjnm') is not None else '',
            'policy_desc': policy.find('polyItcnCn').text if policy.find('polyItcnCn') is not None else '',
            'support_content': policy.find('sporCn').text if policy.find('sporCn') is not None else '',
            'support_scale': policy.find('sporScvl').text if policy.find('sporScvl') is not None else '',
            'operation_period': policy.find('bizPrdCn').text if policy.find('bizPrdCn') is not None else '',
            'application_repeat_code': policy.find('prdRpttSecd').text if policy.find('prdRpttSecd') is not None else '',
            'application_period': policy.find('rqutPrdCn').text if policy.find('rqutPrdCn') is not None else '',
            'age_info': policy.find('ageInfo').text if policy.find('ageInfo') is not None else '',
            'residence_income_condition': policy.find('prcpCn').text if policy.find('prcpCn') is not None else '',
            'application_process': policy.find('rqutProcCn').text if policy.find('rqutProcCn') is not None else '',
            'participation_limit_target': policy.find('prcpLmttTrgtCn').text if policy.find('prcpLmttTrgtCn') is not None else '',
            'application_procedure': policy.find('rqutProcCn').text if policy.find('rqutProcCn') is not None else '',
            'main_department_name': policy.find('mngtMson').text if policy.find('mngtMson') is not None else '',
            'main_department_contact': policy.find('mngtMrofCherCn').text if policy.find('mngtMrofCherCn') is not None else '',
            'main_department_phone': policy.find('cherCtpcCn').text if policy.find('cherCtpcCn') is not None else '',
            'operating_institution_name': policy.find('cnsgNmor').text if policy.find('cnsgNmor') is not None else '',
            'operating_institution_contact': policy.find('tintCherCn').text if policy.find('tintCherCn') is not None else '',
            'operating_institution_phone': policy.find('tintCherCtpcCn').text if policy.find('tintCherCtpcCn') is not None else '',
            'submission_documents': policy.find('pstnPaprCn').text if policy.find('pstnPaprCn') is not None else '',
            'evaluation_and_announcement': policy.find('jdgnPresCn').text if policy.find('jdgnPresCn') is not None else '',
            'application_site_url': policy.find('rqutUrla').text if policy.find('rqutUrla') is not None else '',
            'reference_site_url1': policy.find('rfcSiteUrla1').text if policy.find('rfcSiteUrla1') is not None else '',
            'reference_site_url2': policy.find('rfcSiteUrla2').text if policy.find('rfcSiteUrla2') is not None else '',
            'etc': policy.find('etct').text if policy.find('etct') is not None else '',
            'policy_field_code': policy.find('polyRlmCd').text if policy.find('polyRlmCd') is not None else ''
        }
        data_list.append(data) # 파싱된 데이터를 리스트에 추가
    return data_list

# 각 셀의 첫 글자가 '-'인 경우 제거하는 함수 - CSV파일에서 #NAME 오류 방지
def remove_equal_sign(value):
    if isinstance(value, str) and value.startswith('-'):
        return value[1:]
    return value

# 정책분야코드별로 데이터를 가져와 저장
for policy_name, policy_code in policy_codes.items():
    print(f"Fetching data for policy field: {policy_name}")
    params['bizTycdSel'] = policy_code
    page_index = 1

    while True:
        params['pageIndex'] = page_index
        try:
            response = requests.get(base_url, params=params)
            response.raise_for_status()  # HTTP 오류가 발생하면 예외를 발생시킵니다.

            # 응답 내용을 출력하여 디버깅
            print(f"Response for {policy_name}, page {page_index}: {response.text}")

            # XML 응답을 파싱
            data = parse_xml(response.text)
            if not data:
                print(f"No more data found for policy field: {policy_name}, page {page_index}")
                break

            # 전체 데이터를 리스트에 추가
            all_data.extend(data)
            page_index += 1
        except requests.exceptions.RequestException as e:
            print(f"Failed to fetch data for policy field: {policy_name}, page {page_index}. Error: {e}")
            break
        except ET.ParseError as e:
            print(f"Failed to parse XML response for policy field: {policy_name}, page {page_index}. Error: {e}")
            break

# 전체 데이터를 DataFrame으로 변환
if all_data:
    df_all = pd.DataFrame(all_data)

    # DataFrame의 모든 셀에 '-' 제거 함수 적용
    df_all = df_all.applymap(remove_equal_sign)

    # 파일명에 날짜와 시간을 추가하여 저장
    current_time = datetime.datetime.now().strftime('%Y%m%d_%H%M%S')
    output_file = os.path.join(save_dir, f'allpolicy_{current_time}.csv')
    df_all.to_csv(output_file, index=False, encoding='utf-8-sig')

    print(f"수정된 파일이 '{output_file}'에 저장되었습니다.")

print("데이터 저장 완료")

# 데이터베이스 업데이트 함수
def update_database():
    api_url = base_url
    api_key = '온라인청년센터 API 값' # API값 입력

    # Oracle 데이터베이스 연결 설정
    dsn_tns = cx_Oracle.makedsn('DB URL', 'PORT번호', service_name='XE')
    conn = cx_Oracle.connect(user='DB사용자이름', password='DB PASSWORD', dsn=dsn_tns)
    cursor = conn.cursor()

    # 기존 정책 데이터 가져오기
    cursor.execute("SELECT policy_id FROM ex_policy")
    existing_policy_ids = [row[0] for row in cursor.fetchall()]

    all_data = []

    # 각 정책분야코드별로 데이터를 가져옴
    for policy_name, policy_code in policy_codes.items():
        print(f"Fetching data for policy field: {policy_name}")
        params = {
            'openApiVlak': api_key,
            'display': 100,
            'pageIndex': 1,
            'bizTycdSel': policy_code
        }
        page_index = 1

        # 페이지를 순회하며 데이터를 가져옴
        while True:
            params['pageIndex'] = page_index
            try:
                response = requests.get(api_url, params=params)  # API 요청
                response.raise_for_status()
                print(f"Response for {policy_name}, page {page_index}: {response.text}")

                data = parse_xml(response.text)  # XML 응답을 파싱
                if not data:
                    print(f"No more data found for policy field: {policy_name}, page {page_index}")
                    break

                all_data.extend(data)  # 전체 데이터 리스트에 추가
                page_index += 1
            except requests.exceptions.RequestException as e:
                print(f"Failed to fetch data for policy field: {policy_name}, page {page_index}. Error: {e}")
                break
            except ET.ParseError as e:
                print(f"Failed to parse XML response for policy field: {policy_name}, page {page_index}. Error: {e}")
                break

    if all_data:
        df_all = pd.DataFrame(all_data)  # 데이터를 DataFrame으로 변환
        df_all = df_all.applymap(remove_equal_sign)  # 각 셀에 '-' 제거 함수 적용
        
        # null 값을 결측치로 처리
        df_all.fillna('', inplace=True)

        # 새로운 데이터에서 기존 정책 제거
        new_data = df_all[~df_all['policy_id'].isin(existing_policy_ids)]
        if not new_data.empty:
            new_data['CREATED_AT'] = datetime.datetime.now()
            new_data['UPDATED_AT'] = datetime.datetime.now()

            insert_sql = '''
            INSERT INTO ex_policy (
                policy_id, org_code, policy_name, policy_desc, support_content, support_scale, operation_period, 
                application_repeat_code, application_period, age_info, residence_income_condition, application_process, 
                participation_limit_target, application_procedure, main_department_name, main_department_contact, 
                main_department_phone, operating_institution_name, operating_institution_contact, operating_institution_phone, 
                submission_documents, evaluation_and_announcement, application_site_url, reference_site_url1, reference_site_url2, 
                etc, policy_field_code, CREATED_AT, UPDATED_AT
            ) VALUES (
                :1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13, :14, :15, :16, :17, :18, :19, :20, :21, :22, :23, :24, 
                :25, :26, :27, :28, :29
            )
            '''
            for idx, row in new_data.iterrows():
                row_data = (
                    row['policy_id'], row['org_code'], row['policy_name'], row['policy_desc'], row['support_content'],
                    row['support_scale'], row['operation_period'], row['application_repeat_code'], row['application_period'],
                    row['age_info'], row['residence_income_condition'], row['application_process'], row['participation_limit_target'],
                    row['application_procedure'], row['main_department_name'], row['main_department_contact'], row['main_department_phone'],
                    row['operating_institution_name'], row['operating_institution_contact'], row['operating_institution_phone'],
                    row['submission_documents'], row['evaluation_and_announcement'], row['application_site_url'],
                    row['reference_site_url1'], row['reference_site_url2'], row['etc'], row['policy_field_code'],
                    row['CREATED_AT'], row['UPDATED_AT']
                )
                try:
                    cursor.execute(insert_sql, row_data)  # 새로운 데이터를 데이터베이스에 삽입
                except cx_Oracle.DatabaseError as e:
                    error, = e.args
                    print(f"Error inserting row {idx+1}: {error.message}")
                    print("Values being inserted:")
                    for i, val in enumerate(row_data):
                        print(f"{i+1}: {val}")

    conn.commit()  # 변경사항 커밋
    cursor.close()  # 커서 닫기
    conn.close()  # 연결 종료

# 매일 아침 9시에 실행되도록 스케줄 설정
def job():
    current_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print(f"Updating database at {current_time}")
    update_database()
    print("Database update completed.")

# 스케줄러 설정
schedule.every().day.at("09:00").do(job)

if __name__ == "__main__":
    while True:
        schedule.run_pending()
        time.sleep(1)
