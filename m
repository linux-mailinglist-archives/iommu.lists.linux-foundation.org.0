Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 752B2189558
	for <lists.iommu@lfdr.de>; Wed, 18 Mar 2020 06:28:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E0B5286F8F;
	Wed, 18 Mar 2020 05:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7IvuqB8TBdJo; Wed, 18 Mar 2020 05:27:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3DD6686F85;
	Wed, 18 Mar 2020 05:27:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2400EC013E;
	Wed, 18 Mar 2020 05:27:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D65D7C013E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 05:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CF00325C1C
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 05:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PD20DQbdQBQ for <iommu@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 05:27:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by silver.osuosl.org (Postfix) with ESMTPS id E0B4D23143
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 05:27:56 +0000 (UTC)
IronPort-SDR: 4qFvuM76hzXEv/HcJe8ryTM72rp2SI0eGEpTFgKFzGFu5TpOilpv3WdfUgQFb+EPeRdxyBaBDp
 6GzmN7MT8Hfw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 22:27:56 -0700
IronPort-SDR: uZEuCHI+tEzJyoqs0pj1nsWFmlhiL3CqHyjZh9IskV9mrJQUfPSjNCQIs+AwzKnKtdhWXFt1tu
 TFHnYSwAOQvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; d="scan'208";a="263274199"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.212.140])
 ([10.254.212.140])
 by orsmga002.jf.intel.com with ESMTP; 17 Mar 2020 22:27:54 -0700
Subject: Re: [PATCH] iommu/vt-d: silence a RCU-list debugging warning
To: Qian Cai <cai@lca.pw>, jroedel@suse.de
References: <20200317150326.1659-1-cai@lca.pw>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <36b9e69b-ee3f-c17d-1788-64448ce8bc14@linux.intel.com>
Date: Wed, 18 Mar 2020 13:27:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200317150326.1659-1-cai@lca.pw>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020/3/17 23:03, Qian Cai wrote:
> dmar_find_atsr() calls list_for_each_entry_rcu() outside of an RCU read
> side critical section but with dmar_global_lock held. Silence this
> false positive.
> 
>   drivers/iommu/intel-iommu.c:4504 RCU-list traversed in non-reader section!!
>   1 lock held by swapper/0/1:
>   #0: ffffffff9755bee8 (dmar_global_lock){+.+.}, at: intel_iommu_init+0x1a6/0xe19
> 
>   Call Trace:
>    dump_stack+0xa4/0xfe
>    lockdep_rcu_suspicious+0xeb/0xf5
>    dmar_find_atsr+0x1ab/0x1c0
>    dmar_parse_one_atsr+0x64/0x220
>    dmar_walk_remapping_entries+0x130/0x380
>    dmar_table_init+0x166/0x243
>    intel_iommu_init+0x1ab/0xe19
>    pci_iommu_init+0x1a/0x44
>    do_one_initcall+0xae/0x4d0
>    kernel_init_freeable+0x412/0x4c5
>    kernel_init+0x19/0x193
> 
> Signed-off-by: Qian Cai <cai@lca.pw>

How about changing the commit subject to
"iommu/vt-d: Silence RCU-list debugging warning in dmar_find_atsr()"?

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> ---
>   drivers/iommu/intel-iommu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 4be549478691..ef0a5246700e 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -4501,7 +4501,8 @@ static struct dmar_atsr_unit *dmar_find_atsr(struct acpi_dmar_atsr *atsr)
>   	struct dmar_atsr_unit *atsru;
>   	struct acpi_dmar_atsr *tmp;
>   
> -	list_for_each_entry_rcu(atsru, &dmar_atsr_units, list) {
> +	list_for_each_entry_rcu(atsru, &dmar_atsr_units, list,
> +				dmar_rcu_check()) {
>   		tmp = (struct acpi_dmar_atsr *)atsru->hdr;
>   		if (atsr->segment != tmp->segment)
>   			continue;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
