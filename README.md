
# TAPG ASSESSMENT ISA ANSHORI S. KOM.
Aplikasi tapg_analytics dbt project dibuat oleh Isa Anshori S.Kom. sebagai syarat assesment pegawai dengan jabatan Data Engineer Section Head di PT. Triputra Agro Persada Group.


# Bagaimana Anda akan mengoptimalkan query deteksi anomali tersebut jika volume data meningkat 100x lipat ?
Terapkan cluster key pada tabel hasil generate dbt model khususnya pada kolom yang sering dijadikan filter. Saya terapkan cluster key pada kolom purchase_date pada tabel fct_sales, daily_revenue, dan z_scores (lihat file fct_sales.sql, daily_revenue.sql, dan z_scores.sql pada model).

Sayangnya waktu yang diberikan tidak memungkinkan saya untuk eksplorasi lebih dalam lagi dalam peningkatan kinerja melalui Snowflake. Saran dari hasil pencarian literasi terkait kasus peningkatan kinerja ini dapat juga dicoba :
- Incremental Model
- Materialized View
- Incremental Anomaly Detection
- Warehouse Scaling
- Caching

Saya akan uraikan dari pemerian di atas setelah diterima sebagai Data Engineer Section Head.

Terima kasih.
Salam
Isa Anshori