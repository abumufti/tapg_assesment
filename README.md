
# TAPG ASSESSMENT ISA ANSHORI S. KOM.
Aplikasi tapg_analytics dbt project dibuat oleh Isa Anshori S.Kom. sebagai syarat assesment pegawai dengan jabatan Data Engineer Section Head di PT. Triputra Agro Persada Group.

# Bagaimana Anda akan mengoptimalkan query deteksi anomali tersebut jika volume data meningkat 100x lipat ?
1. Gunakan Dynamic Table pada table hasil generate dbt model yang mana tabel merujuk pada table raw. Lihat settingan Dynamic Table pada file dbt_project.yml.

Dengan cara ini, data pada table selalu update mengikuti perubahan data yang terjadi pada table raw. Dynamic table saya terapkan pada:ANOMALY_Z3_REPORT, ANOMALY_Z2_REPORT, DAILY_REVENUE, DIM_CUSTOMER, DIM_PRODUCT, FCT_SALES, FCT_SALES_COMPLETE, dan Z_SCORES. 

2. Terapkan cluster key pada tabel hasil generate dbt model khususnya pada kolom yang sering dijadikan filter. 

Saya terapkan cluster key pada kolom purchase_date pada tabel fct_sales, daily_revenue, dan z_scores (lihat file fct_sales.sql, daily_revenue.sql, dan z_scores.sql pada model).

Apabila kedua langkah di atas belum menjadi solusi optimasi apabila volume data meningkat 100x lipat. Saran dari hasil pencarian literasi terkait kasus peningkatan kinerja ini patut dicoba :

- Incremental Model
Gunakan materialisasi incremental sehingga hanya data baru yang diproses setiap kali menjalankan dbt.

- Materialized View
Simpan hasil agregasi revenue harian sebagai materialized view agar query deteksi anomali tidak perlu menghitung ulang seluruh transaksi.

- Incremental Anomaly Detection
Hitung Z-score hanya untuk data baru, bukan mengulang seluruh histori setiap eksekusi.

- Warehouse Scaling
Manfaatkan kemampuan Snowflake untuk meningkatkan ukuran warehouse (misalnya dari Small ke Medium/Large) atau menggunakan multi-cluster warehouse saat beban kerja meningkat.

- Caching
Manfaatkan result cache dan warehouse cache bawaan Snowflake agar query yang sama dapat dieksekusi lebih cepat tanpa membaca ulang data.

Terima kasih.
Salam
Isa Anshori