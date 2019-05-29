Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 535562D3BF
	for <lists.iommu@lfdr.de>; Wed, 29 May 2019 04:22:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 130F623CE;
	Wed, 29 May 2019 02:22:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DC0642270
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 02:19:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 784CA6C5
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 02:19:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 May 2019 19:19:46 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga004.jf.intel.com with ESMTP; 28 May 2019 19:19:43 -0700
Subject: Re: [PATCH v5 4/7] iommu/vt-d: Handle RMRR with PCI bridge device
	scopes
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	joro@8bytes.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, dwmw2@infradead.org, robin.murphy@arm.com
References: <20190528115025.17194-1-eric.auger@redhat.com>
	<20190528115025.17194-5-eric.auger@redhat.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <3f33a110-97a1-bd28-cacd-1df40a3922b0@linux.intel.com>
Date: Wed, 29 May 2019 10:12:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528115025.17194-5-eric.auger@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jean-philippe.brucker@arm.com, alex.williamson@redhat.com
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

On 5/28/19 7:50 PM, Eric Auger wrote:
> When reading the vtd specification and especially the
> Reserved Memory Region Reporting Structure chapter,
> it is not obvious a device scope element cannot be a
> PCI-PCI bridge, in which case all downstream ports are
> likely to access the reserved memory region. Let's handle
> this case in device_has_rmrr.


This looks good to me.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
Baolu

> 
> Fixes: ea2447f700ca ("intel-iommu: Prevent devices with RMRRs from being placed into SI Domain")
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - is_downstream_to_pci_bridge helper introduced in a separate patch
> ---
>   drivers/iommu/intel-iommu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 879f11c82b05..35508687f178 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -2910,7 +2910,8 @@ static bool device_has_rmrr(struct device *dev)
>   		 */
>   		for_each_active_dev_scope(rmrr->devices,
>   					  rmrr->devices_cnt, i, tmp)
> -			if (tmp == dev) {
> +			if (tmp == dev ||
> +			    is_downstream_to_pci_bridge(dev, tmp)) {
>   				rcu_read_unlock();
>   				return true;
>   			}
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
