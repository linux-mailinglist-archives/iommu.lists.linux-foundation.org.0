Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABB1528A58
	for <lists.iommu@lfdr.de>; Mon, 16 May 2022 18:29:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7604417CB;
	Mon, 16 May 2022 16:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NKJtgmphmcNA; Mon, 16 May 2022 16:29:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7FED040912;
	Mon, 16 May 2022 16:29:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 640D2C002D;
	Mon, 16 May 2022 16:29:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 092C5C002D
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 16:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD176610D5
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 16:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewXoq5nJsNQ9 for <iommu@lists.linux-foundation.org>;
 Mon, 16 May 2022 16:29:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E1F0610A5
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 16:29:08 +0000 (UTC)
Received: from fraeml709-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4L24PV63Xzz67h1V;
 Tue, 17 May 2022 00:26:06 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml709-chm.china.huawei.com (10.206.15.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 16 May 2022 18:29:06 +0200
Received: from [10.47.25.151] (10.47.25.151) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 16 May
 2022 17:29:05 +0100
Message-ID: <d874dd82-30fd-f8e0-b7ab-0c9d14e47324@huawei.com>
Date: Mon, 16 May 2022 17:29:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v8 4/8] perf arm: Refactor event list iteration in
 auxtrace_record__init()
To: Yicong Yang <yangyicong@hisilicon.com>, <gregkh@linuxfoundation.org>,
 <alexander.shishkin@linux.intel.com>, <leo.yan@linaro.org>,
 <james.clark@arm.com>, <will@kernel.org>, <robin.murphy@arm.com>,
 <acme@kernel.org>, <jonathan.cameron@huawei.com>
References: <20220516125223.32012-1-yangyicong@hisilicon.com>
 <20220516125223.32012-5-yangyicong@hisilicon.com>
In-Reply-To: <20220516125223.32012-5-yangyicong@hisilicon.com>
X-Originating-IP: [10.47.25.151]
X-ClientProxiedBy: lhreml714-chm.china.huawei.com (10.201.108.65) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: mark.rutland@arm.com, zhangshaokun@hisilicon.com, prime.zeng@huawei.com,
 mathieu.poirier@linaro.org, suzuki.poulose@arm.com, peterz@infradead.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 linux-perf-users@vger.kernel.org, iommu@lists.linux-foundation.org,
 mingo@redhat.com, helgaas@kernel.org, liuqi115@huawei.com,
 linux-arm-kernel@lists.infradead.org
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
From: John Garry via iommu <iommu@lists.linux-foundation.org>
Reply-To: John Garry <john.garry@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 16/05/2022 13:52, Yicong Yang wrote:

As requested before, please mention "perf tool" in the commit subject

> From: Qi Liu <liuqi115@huawei.com>
> 
> Use find_pmu_for_event() to simplify logic in auxtrace_record__init().
> 
> Signed-off-by: Qi Liu <liuqi115@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   tools/perf/arch/arm/util/auxtrace.c | 53 ++++++++++++++++++-----------
>   1 file changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/perf/arch/arm/util/auxtrace.c b/tools/perf/arch/arm/util/auxtrace.c
> index 5fc6a2a3dbc5..384c7cfda0fd 100644
> --- a/tools/perf/arch/arm/util/auxtrace.c
> +++ b/tools/perf/arch/arm/util/auxtrace.c
> @@ -50,16 +50,32 @@ static struct perf_pmu **find_all_arm_spe_pmus(int *nr_spes, int *err)
>   	return arm_spe_pmus;
>   }
>   
> +static struct perf_pmu *find_pmu_for_event(struct perf_pmu **pmus,
> +					   int pmu_nr, struct evsel *evsel)
> +{
> +	int i;
> +
> +	if (!pmus)
> +		return NULL;
> +
> +	for (i = 0; i < pmu_nr; i++) {
> +		if (evsel->core.attr.type == pmus[i]->type)
> +			return pmus[i];
> +	}
> +
> +	return NULL;
> +}
> +
>   struct auxtrace_record
>   *auxtrace_record__init(struct evlist *evlist, int *err)
>   {
> -	struct perf_pmu	*cs_etm_pmu;
> +	struct perf_pmu	*cs_etm_pmu = NULL;
> +	struct perf_pmu **arm_spe_pmus = NULL;
>   	struct evsel *evsel;
> -	bool found_etm = false;
> +	struct perf_pmu *found_etm = NULL;
>   	struct perf_pmu *found_spe = NULL;
> -	struct perf_pmu **arm_spe_pmus = NULL;
> +	int auxtrace_event_cnt = 0;
>   	int nr_spes = 0;
> -	int i = 0;
>   
>   	if (!evlist)
>   		return NULL;
> @@ -68,24 +84,23 @@ struct auxtrace_record
>   	arm_spe_pmus = find_all_arm_spe_pmus(&nr_spes, err);
>   
>   	evlist__for_each_entry(evlist, evsel) {
> -		if (cs_etm_pmu &&
> -		    evsel->core.attr.type == cs_etm_pmu->type)
> -			found_etm = true;
> -
> -		if (!nr_spes || found_spe)
> -			continue;
> -
> -		for (i = 0; i < nr_spes; i++) {
> -			if (evsel->core.attr.type == arm_spe_pmus[i]->type) {
> -				found_spe = arm_spe_pmus[i];
> -				break;
> -			}
> -		}
> +		if (cs_etm_pmu && !found_etm)
> +			found_etm = find_pmu_for_event(&cs_etm_pmu, 1, evsel);
> +
> +		if (arm_spe_pmus && !found_spe)
> +			found_spe = find_pmu_for_event(arm_spe_pmus, nr_spes, evsel);
>   	}
> +
>   	free(arm_spe_pmus);
>   
> -	if (found_etm && found_spe) {
> -		pr_err("Concurrent ARM Coresight ETM and SPE operation not currently supported\n");
> +	if (found_etm)
> +		auxtrace_event_cnt++;
> +
> +	if (found_spe)
> +		auxtrace_event_cnt++;
> +
> +	if (auxtrace_event_cnt > 1) {
> +		pr_err("Concurrent AUX trace operation not currently supported\n");
>   		*err = -EOPNOTSUPP;
>   		return NULL;
>   	}

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
