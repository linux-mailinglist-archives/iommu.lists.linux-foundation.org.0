Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF395284A0
	for <lists.iommu@lfdr.de>; Mon, 16 May 2022 14:53:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 469F24162C;
	Mon, 16 May 2022 12:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yRXw1J1kU9Cm; Mon, 16 May 2022 12:53:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EC17A417D0;
	Mon, 16 May 2022 12:53:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20BC3C002D;
	Mon, 16 May 2022 12:53:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 703A9C0032
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 12:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 632616106C
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 12:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5QDygU8ehJyx for <iommu@lists.linux-foundation.org>;
 Mon, 16 May 2022 12:53:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45F3361065
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 12:53:17 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4L1zZF0rX9zCsqK;
 Mon, 16 May 2022 20:48:21 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 16 May 2022 20:53:13 +0800
To: <gregkh@linuxfoundation.org>, <alexander.shishkin@linux.intel.com>,
 <leo.yan@linaro.org>, <james.clark@arm.com>, <will@kernel.org>,
 <robin.murphy@arm.com>, <acme@kernel.org>, <jonathan.cameron@huawei.com>,
 <john.garry@huawei.com>
Subject: [PATCH v8 4/8] perf arm: Refactor event list iteration in
 auxtrace_record__init()
Date: Mon, 16 May 2022 20:52:19 +0800
Message-ID: <20220516125223.32012-5-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220516125223.32012-1-yangyicong@hisilicon.com>
References: <20220516125223.32012-1-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Cc: mark.rutland@arm.com, zhangshaokun@hisilicon.com, prime.zeng@huawei.com,
 mathieu.poirier@linaro.org, suzuki.poulose@arm.com, peterz@infradead.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 linux-perf-users@vger.kernel.org, iommu@lists.linux-foundation.org,
 mingo@redhat.com, helgaas@kernel.org, yangyicong@hisilicon.com,
 liuqi115@huawei.com, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
From: Yicong Yang via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yicong Yang <yangyicong@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Qi Liu <liuqi115@huawei.com>

Use find_pmu_for_event() to simplify logic in auxtrace_record__init().

Signed-off-by: Qi Liu <liuqi115@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 tools/perf/arch/arm/util/auxtrace.c | 53 ++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/tools/perf/arch/arm/util/auxtrace.c b/tools/perf/arch/arm/util/auxtrace.c
index 5fc6a2a3dbc5..384c7cfda0fd 100644
--- a/tools/perf/arch/arm/util/auxtrace.c
+++ b/tools/perf/arch/arm/util/auxtrace.c
@@ -50,16 +50,32 @@ static struct perf_pmu **find_all_arm_spe_pmus(int *nr_spes, int *err)
 	return arm_spe_pmus;
 }
 
+static struct perf_pmu *find_pmu_for_event(struct perf_pmu **pmus,
+					   int pmu_nr, struct evsel *evsel)
+{
+	int i;
+
+	if (!pmus)
+		return NULL;
+
+	for (i = 0; i < pmu_nr; i++) {
+		if (evsel->core.attr.type == pmus[i]->type)
+			return pmus[i];
+	}
+
+	return NULL;
+}
+
 struct auxtrace_record
 *auxtrace_record__init(struct evlist *evlist, int *err)
 {
-	struct perf_pmu	*cs_etm_pmu;
+	struct perf_pmu	*cs_etm_pmu = NULL;
+	struct perf_pmu **arm_spe_pmus = NULL;
 	struct evsel *evsel;
-	bool found_etm = false;
+	struct perf_pmu *found_etm = NULL;
 	struct perf_pmu *found_spe = NULL;
-	struct perf_pmu **arm_spe_pmus = NULL;
+	int auxtrace_event_cnt = 0;
 	int nr_spes = 0;
-	int i = 0;
 
 	if (!evlist)
 		return NULL;
@@ -68,24 +84,23 @@ struct auxtrace_record
 	arm_spe_pmus = find_all_arm_spe_pmus(&nr_spes, err);
 
 	evlist__for_each_entry(evlist, evsel) {
-		if (cs_etm_pmu &&
-		    evsel->core.attr.type == cs_etm_pmu->type)
-			found_etm = true;
-
-		if (!nr_spes || found_spe)
-			continue;
-
-		for (i = 0; i < nr_spes; i++) {
-			if (evsel->core.attr.type == arm_spe_pmus[i]->type) {
-				found_spe = arm_spe_pmus[i];
-				break;
-			}
-		}
+		if (cs_etm_pmu && !found_etm)
+			found_etm = find_pmu_for_event(&cs_etm_pmu, 1, evsel);
+
+		if (arm_spe_pmus && !found_spe)
+			found_spe = find_pmu_for_event(arm_spe_pmus, nr_spes, evsel);
 	}
+
 	free(arm_spe_pmus);
 
-	if (found_etm && found_spe) {
-		pr_err("Concurrent ARM Coresight ETM and SPE operation not currently supported\n");
+	if (found_etm)
+		auxtrace_event_cnt++;
+
+	if (found_spe)
+		auxtrace_event_cnt++;
+
+	if (auxtrace_event_cnt > 1) {
+		pr_err("Concurrent AUX trace operation not currently supported\n");
 		*err = -EOPNOTSUPP;
 		return NULL;
 	}
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
