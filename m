Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 663C91BB15
	for <lists.iommu@lfdr.de>; Mon, 13 May 2019 18:38:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C2A96E7F;
	Mon, 13 May 2019 16:38:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 484E2E2F
	for <iommu@lists.linux-foundation.org>;
	Mon, 13 May 2019 16:38:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2C90C83A
	for <iommu@lists.linux-foundation.org>;
	Mon, 13 May 2019 16:38:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 May 2019 09:38:08 -0700
X-ExtLoop1: 1
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga005.jf.intel.com with ESMTP; 13 May 2019 09:38:07 -0700
Date: Mon, 13 May 2019 09:41:00 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 3/4] iommu/vt-d: Handle RMRR with PCI bridge device scopes
Message-ID: <20190513094100.6fd1276b@jacob-builder>
In-Reply-To: <20190513071302.30718-4-eric.auger@redhat.com>
References: <20190513071302.30718-1-eric.auger@redhat.com>
	<20190513071302.30718-4-eric.auger@redhat.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alex.williamson@redhat.com, robin.murphy@arm.com, will.deacon@arm.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	sudeep.holla@arm.com, dwmw2@infradead.org, eric.auger.pro@gmail.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, 13 May 2019 09:13:01 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> When reading the vtd specification and especially the
> Reserved Memory Region Reporting Structure chapter,
> it is not obvious a device scope element cannot be a
> PCI-PCI bridge, in which case all downstream ports are
> likely to access the reserved memory region. Let's handle
> this case in device_has_rmrr.
> 
> Fixes: ea2447f700ca ("intel-iommu: Prevent devices with RMRRs from
> being placed into SI Domain")
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  drivers/iommu/intel-iommu.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index e2134b13c9ae..89d82a1d50b1 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -736,12 +736,31 @@ static int iommu_dummy(struct device *dev)
>  	return dev->archdata.iommu == DUMMY_DEVICE_DOMAIN_INFO;
>  }
>  
> +static bool
> +is_downstream_to_pci_bridge(struct device *deva, struct device *devb)
> +{
> +	struct pci_dev *pdeva, *pdevb;
> +
is there a more illustrative name for these. i guess deva is is the
bridge dev?
> +	if (!dev_is_pci(deva) || !dev_is_pci(devb))
> +		return false;
> +
> +	pdeva = to_pci_dev(deva);
> +	pdevb = to_pci_dev(devb);
> +
> +	if (pdevb->subordinate &&
> +	    pdevb->subordinate->number <= pdeva->bus->number &&
> +	    pdevb->subordinate->busn_res.end >= pdeva->bus->number)
> +		return true;
> +
> +	return false;
> +}
> +
this seems to be a separate cleanup patch.
>  static struct intel_iommu *device_to_iommu(struct device *dev, u8
> *bus, u8 *devfn) {
>  	struct dmar_drhd_unit *drhd = NULL;
>  	struct intel_iommu *iommu;
>  	struct device *tmp;
> -	struct pci_dev *ptmp, *pdev = NULL;
> +	struct pci_dev *pdev = NULL;
>  	u16 segment = 0;
>  	int i;
>  
> @@ -787,13 +806,7 @@ static struct intel_iommu
> *device_to_iommu(struct device *dev, u8 *bus, u8 *devf goto out;
>  			}
>  
> -			if (!pdev || !dev_is_pci(tmp))
> -				continue;
> -
> -			ptmp = to_pci_dev(tmp);
> -			if (ptmp->subordinate &&
> -			    ptmp->subordinate->number <=
> pdev->bus->number &&
> -			    ptmp->subordinate->busn_res.end >=
> pdev->bus->number)
> +			if (is_downstream_to_pci_bridge(dev, tmp))
>  				goto got_pdev;
>  		}
>  
> @@ -2886,7 +2899,8 @@ static bool device_has_rmrr(struct device *dev)
>  		 */
>  		for_each_active_dev_scope(rmrr->devices,
>  					  rmrr->devices_cnt, i, tmp)
> -			if (tmp == dev) {
> +			if (tmp == dev ||
> +			    is_downstream_to_pci_bridge(dev, tmp)) {
>  				rcu_read_unlock();
>  				return true;
>  			}

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
