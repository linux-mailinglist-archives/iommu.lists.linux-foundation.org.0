Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D77484FC312
	for <lists.iommu@lfdr.de>; Mon, 11 Apr 2022 19:20:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EDBA40925;
	Mon, 11 Apr 2022 17:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIoB0VZ5gmYV; Mon, 11 Apr 2022 17:20:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C88EB41498;
	Mon, 11 Apr 2022 17:19:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 972BFC0084;
	Mon, 11 Apr 2022 17:19:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5049C0033
 for <iommu@lists.linux-foundation.org>; Mon, 11 Apr 2022 17:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 923EE81AAB
 for <iommu@lists.linux-foundation.org>; Mon, 11 Apr 2022 17:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d7cA4A1ARlBH for <iommu@lists.linux-foundation.org>;
 Mon, 11 Apr 2022 17:19:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA9C581775
 for <iommu@lists.linux-foundation.org>; Mon, 11 Apr 2022 17:19:55 +0000 (UTC)
Received: from fraeml709-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KcbCL6d6gz688pK;
 Tue, 12 Apr 2022 01:17:50 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml709-chm.china.huawei.com (10.206.15.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Apr 2022 19:19:52 +0200
Received: from [10.47.91.197] (10.47.91.197) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 11 Apr
 2022 18:19:51 +0100
Message-ID: <276c24d2-daf5-5eba-26b9-55edd4a45537@huawei.com>
Date: Mon, 11 Apr 2022 18:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v7 5/7] perf tool: Add support for HiSilicon PCIe Tune and
 Trace device driver
To: Yicong Yang <yangyicong@hisilicon.com>, <gregkh@linuxfoundation.org>,
 <helgaas@kernel.org>, <alexander.shishkin@linux.intel.com>,
 <lorenzo.pieralisi@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
 <mathieu.poirier@linaro.org>, <suzuki.poulose@arm.com>,
 <mike.leach@linaro.org>, <leo.yan@linaro.org>, <jonathan.cameron@huawei.com>, 
 <daniel.thompson@linaro.org>, <joro@8bytes.org>,
 <shameerali.kolothum.thodi@huawei.com>, <robin.murphy@arm.com>,
 <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <coresight@lists.linaro.org>, <linux-pci@vger.kernel.org>,
 <linux-perf-users@vger.kernel.org>, <iommu@lists.linux-foundation.org>
References: <20220407125841.3678-1-yangyicong@hisilicon.com>
 <20220407125841.3678-6-yangyicong@hisilicon.com>
In-Reply-To: <20220407125841.3678-6-yangyicong@hisilicon.com>
X-Originating-IP: [10.47.91.197]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: zhangshaokun@hisilicon.com, liuqi115@huawei.com, linuxarm@huawei.com,
 prime.zeng@huawei.com
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

On 07/04/2022 13:58, Yicong Yang wrote:
> From: Qi Liu <liuqi115@huawei.com>
> 
> 'perf record' and 'perf report --dump-raw-trace' supported in this
> patch.
> 
> Example usage:
> 
> Output will contain raw PTT data and its textual representation, such
> as:
> 
> 0 0 0x5810 [0x30]: PERF_RECORD_AUXTRACE size: 0x400000  offset: 0
> ref: 0xa5d50c725  idx: 0  tid: -1  cpu: 0
> .
> . ... HISI PTT data: size 4194304 bytes
> .  00000000: 00 00 00 00                                 Prefix
> .  00000004: 08 20 00 60                                 Header DW0
> .  00000008: ff 02 00 01                                 Header DW1
> .  0000000c: 20 08 00 00                                 Header DW2
> .  00000010: 10 e7 44 ab                                 Header DW3
> .  00000014: 2a a8 1e 01                                 Time
> .  00000020: 00 00 00 00                                 Prefix
> .  00000024: 01 00 00 60                                 Header DW0
> .  00000028: 0f 1e 00 01                                 Header DW1
> .  0000002c: 04 00 00 00                                 Header DW2
> .  00000030: 40 00 81 02                                 Header DW3
> .  00000034: ee 02 00 00                                 Time
> ....
> 
> Signed-off-by: Qi Liu <liuqi115@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   tools/perf/arch/arm/util/auxtrace.c           |  76 +++++-
>   tools/perf/arch/arm/util/pmu.c                |   3 +
>   tools/perf/arch/arm64/util/Build              |   2 +-
>   tools/perf/arch/arm64/util/hisi_ptt.c         | 195 ++++++++++++++++
>   tools/perf/util/Build                         |   2 +
>   tools/perf/util/auxtrace.c                    |   4 +
>   tools/perf/util/auxtrace.h                    |   1 +
>   tools/perf/util/hisi-ptt-decoder/Build        |   1 +
>   .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 170 ++++++++++++++
>   .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |  28 +++
>   tools/perf/util/hisi_ptt.c                    | 218 ++++++++++++++++++
>   tools/perf/util/hisi_ptt.h                    |  28 +++
>   12 files changed, 724 insertions(+), 4 deletions(-)
>   create mode 100644 tools/perf/arch/arm64/util/hisi_ptt.c
>   create mode 100644 tools/perf/util/hisi-ptt-decoder/Build
>   create mode 100644 tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
>   create mode 100644 tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
>   create mode 100644 tools/perf/util/hisi_ptt.c
>   create mode 100644 tools/perf/util/hisi_ptt.h
> 
> diff --git a/tools/perf/arch/arm/util/auxtrace.c b/tools/perf/arch/arm/util/auxtrace.c
> index 5fc6a2a3dbc5..393f5757c039 100644
> --- a/tools/perf/arch/arm/util/auxtrace.c
> +++ b/tools/perf/arch/arm/util/auxtrace.c
> @@ -4,9 +4,11 @@
>    * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
>    */
>   
> +#include <dirent.h>
>   #include <stdbool.h>
>   #include <linux/coresight-pmu.h>
>   #include <linux/zalloc.h>
> +#include <api/fs/fs.h>
>   
>   #include "../../../util/auxtrace.h"
>   #include "../../../util/debug.h"
> @@ -14,6 +16,7 @@
>   #include "../../../util/pmu.h"
>   #include "cs-etm.h"
>   #include "arm-spe.h"
> +#include "hisi_ptt.h"
>   
>   static struct perf_pmu **find_all_arm_spe_pmus(int *nr_spes, int *err)
>   {
> @@ -50,6 +53,58 @@ static struct perf_pmu **find_all_arm_spe_pmus(int *nr_spes, int *err)
>   	return arm_spe_pmus;
>   }
>   
> +static struct perf_pmu **find_all_hisi_ptt_pmus(int *nr_ptts, int *err)
> +{
> +	const char *sysfs = sysfs__mountpoint();
> +	struct perf_pmu **hisi_ptt_pmus = NULL;
> +	struct dirent *dent;
> +	char path[PATH_MAX];
> +	DIR *dir = NULL;
> +	int idx = 0;
> +
> +	snprintf(path, PATH_MAX, "%s" EVENT_SOURCE_DEVICE_PATH, sysfs);
> +	dir = opendir(path);
> +	if (!dir) {
> +		pr_err("can't read directory '%s'\n", EVENT_SOURCE_DEVICE_PATH);
> +		*err = -EINVAL;
> +		goto out;
> +	}
> +
> +	while ((dent = readdir(dir))) {
> +		if (strstr(dent->d_name, HISI_PTT_PMU_NAME))
> +			(*nr_ptts)++;
> +	}
> +
> +	if (!(*nr_ptts))
> +		goto out;
> +
> +	hisi_ptt_pmus = zalloc(sizeof(struct perf_pmu *) * (*nr_ptts));
> +	if (!hisi_ptt_pmus) {
> +		pr_err("hisi_ptt alloc failed\n");
> +		*err = -ENOMEM;

using PTR_ERR seems better, if possible

> +		goto out;
> +	}
> +
> +	rewinddir(dir);
> +	while ((dent = readdir(dir))) {
> +		if (strstr(dent->d_name, HISI_PTT_PMU_NAME) && idx < (*nr_ptts)) {
> +			hisi_ptt_pmus[idx] = perf_pmu__find(dent->d_name);
> +			if (hisi_ptt_pmus[idx]) {
> +				pr_debug2("%s %d: hisi_ptt_pmu %d type %d name %s\n",

do you really need this?

> +					__func__, __LINE__, idx,
> +					hisi_ptt_pmus[idx]->type,
> +					hisi_ptt_pmus[idx]->name);
> +					idx++;
> +			}
> +
> +		}
> +	}
> +
> +out:
> +	closedir(dir);
> +	return hisi_ptt_pmus;
> +}
> +
>   struct auxtrace_record
>   *auxtrace_record__init(struct evlist *evlist, int *err)
>   {
> @@ -57,8 +112,12 @@ struct auxtrace_record
>   	struct evsel *evsel;
>   	bool found_etm = false;
>   	struct perf_pmu *found_spe = NULL;
> +	struct perf_pmu *found_ptt = NULL;
>   	struct perf_pmu **arm_spe_pmus = NULL;
> +	struct perf_pmu **hisi_ptt_pmus = NULL;
> +
>   	int nr_spes = 0;
> +	int nr_ptts = 0;
>   	int i = 0;
>   
>   	if (!evlist)
> @@ -66,13 +125,14 @@ struct auxtrace_record
>   
>   	cs_etm_pmu = perf_pmu__find(CORESIGHT_ETM_PMU_NAME);
>   	arm_spe_pmus = find_all_arm_spe_pmus(&nr_spes, err);
> +	hisi_ptt_pmus = find_all_hisi_ptt_pmus(&nr_ptts, err);
>   
>   	evlist__for_each_entry(evlist, evsel) {
>   		if (cs_etm_pmu &&
>   		    evsel->core.attr.type == cs_etm_pmu->type)
>   			found_etm = true;
>   
> -		if (!nr_spes || found_spe)
> +		if ((!nr_spes || found_spe) && (!nr_ptts || found_ptt))
>   			continue;
>   
>   		for (i = 0; i < nr_spes; i++) {
> @@ -81,11 +141,18 @@ struct auxtrace_record
>   				break;
>   			}
>   		}
> +
> +		for (i = 0; i < nr_ptts; i++) {
> +			if (evsel->core.attr.type == hisi_ptt_pmus[i]->type) {
> +				found_ptt = hisi_ptt_pmus[i];
> +				break;
> +			}
> +		}
>   	}
>   	free(arm_spe_pmus);

do you need to do something similar for hisi ptt?

>   
> -	if (found_etm && found_spe) {
> -		pr_err("Concurrent ARM Coresight ETM and SPE operation not currently supported\n");
> +	if (found_etm && found_spe && found_ptt) {
> +		pr_err("Concurrent ARM Coresight ETM ,SPE and HiSilicon PCIe Trace operation not currently supported\n");
>   		*err = -EOPNOTSUPP;
>   		return NULL;
>   	}
> @@ -96,6 +163,9 @@ struct auxtrace_record
>   #if defined(__aarch64__)
>   	if (found_spe)
>   		return arm_spe_recording_init(err, found_spe);
> +
> +	if (found_ptt)
> +		return hisi_ptt_recording_init(err, found_ptt);
>   #endif
>   
>   	/*
> diff --git a/tools/perf/arch/arm/util/pmu.c b/tools/perf/arch/arm/util/pmu.c
> index b8b23b9dc598..89a3cedb4557 100644
> --- a/tools/perf/arch/arm/util/pmu.c
> +++ b/tools/perf/arch/arm/util/pmu.c
> @@ -10,6 +10,7 @@
>   #include <linux/string.h>
>   
>   #include "arm-spe.h"
> +#include "hisi_ptt.h"
>   #include "../../../util/pmu.h"
>   
>   struct perf_event_attr
> @@ -22,6 +23,8 @@ struct perf_event_attr
>   #if defined(__aarch64__)
>   	} else if (strstarts(pmu->name, ARM_SPE_PMU_NAME)) {
>   		return arm_spe_pmu_default_config(pmu);
> +	} else if (strstarts(pmu->name, HISI_PTT_PMU_NAME)) {
> +		pmu->selectable = true;
>   #endif
>   	}
>   
> diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/util/Build
> index 9fcb4e68add9..8b7fd1dc9f37 100644
> --- a/tools/perf/arch/arm64/util/Build
> +++ b/tools/perf/arch/arm64/util/Build
> @@ -11,4 +11,4 @@ perf-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
>   perf-$(CONFIG_AUXTRACE) += ../../arm/util/pmu.o \
>   			      ../../arm/util/auxtrace.o \
>   			      ../../arm/util/cs-etm.o \
> -			      arm-spe.o mem-events.o
> +			      arm-spe.o mem-events.o hisi_ptt.o

nit: others use '-' in the name


I'll check the rest tomorrow.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
