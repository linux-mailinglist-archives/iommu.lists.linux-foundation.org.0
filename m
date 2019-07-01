Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D135C49789
	for <lists.iommu@lfdr.de>; Tue, 18 Jun 2019 04:32:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 05833A55;
	Tue, 18 Jun 2019 02:32:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 35412A55
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 02:32:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C9B942C3
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 02:32:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jun 2019 19:32:27 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga004.jf.intel.com with ESMTP; 17 Jun 2019 19:32:25 -0700
Subject: Re: [PATCH] iommu/intel: remove an unused variable "length"
To: Qian Cai <cai@lca.pw>, jroedel@suse.de
References: <20190617132027.1960-1-cai@lca.pw>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <5405235e-50a2-cfbb-3f3d-af7cbefce183@linux.intel.com>
Date: Tue, 18 Jun 2019 10:25:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190617132027.1960-1-cai@lca.pw>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 6/17/19 9:20 PM, Qian Cai wrote:
> The linux-next commit "iommu/vt-d: Duplicate iommu_resv_region objects
> per device list" [1] left out an unused variable,
> 
> drivers/iommu/intel-iommu.c: In function 'dmar_parse_one_rmrr':
> drivers/iommu/intel-iommu.c:4014:9: warning: variable 'length' set but
> not used [-Wunused-but-set-variable]
> 
> [1] https://lore.kernel.org/patchwork/patch/1083073/
> 
> Signed-off-by: Qian Cai <cai@lca.pw>

With regard to the subject, we normally use "iommu/vt-d: ".

Best regards,
Baolu

> ---
>   drivers/iommu/intel-iommu.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 478ac186570b..d86d4ee5cc78 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -4011,7 +4011,6 @@ int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
>   {
>   	struct acpi_dmar_reserved_memory *rmrr;
>   	struct dmar_rmrr_unit *rmrru;
> -	size_t length;
>   
>   	rmrru = kzalloc(sizeof(*rmrru), GFP_KERNEL);
>   	if (!rmrru)
> @@ -4022,8 +4021,6 @@ int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
>   	rmrru->base_address = rmrr->base_address;
>   	rmrru->end_address = rmrr->end_address;
>   
> -	length = rmrr->end_address - rmrr->base_address + 1;
> -
>   	rmrru->devices = dmar_alloc_dev_scope((void *)(rmrr + 1),
>   				((void *)rmrr) + rmrr->header.length,
>   				&rmrru->devices_cnt);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
