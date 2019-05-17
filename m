Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D118921BD5
	for <lists.iommu@lfdr.de>; Fri, 17 May 2019 18:41:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E79D7A95;
	Fri, 17 May 2019 16:41:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BBFDE5A8
	for <iommu@lists.linux-foundation.org>;
	Fri, 17 May 2019 16:41:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2CE4D87A
	for <iommu@lists.linux-foundation.org>;
	Fri, 17 May 2019 16:41:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54D34AC2E5;
	Fri, 17 May 2019 16:41:48 +0000 (UTC)
Received: from x1.home (ovpn-117-92.phx2.redhat.com [10.3.117.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83ECD60F9C;
	Fri, 17 May 2019 16:41:46 +0000 (UTC)
Date: Fri, 17 May 2019 10:41:43 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v2 4/4] vfio: vfio_iommu_type1: implement
	VFIO_IOMMU_INFO_CAPABILITIES
Message-ID: <20190517104143.240082b5@x1.home>
In-Reply-To: <1558109810-18683-5-git-send-email-pmorel@linux.ibm.com>
References: <1558109810-18683-1-git-send-email-pmorel@linux.ibm.com>
	<1558109810-18683-5-git-send-email-pmorel@linux.ibm.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 17 May 2019 16:41:50 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, pasic@linux.vnet.ibm.com, kvm@vger.kernel.org,
	heiko.carstens@de.ibm.com, sebott@linux.vnet.ibm.com,
	walling@linux.ibm.com, linux-kernel@vger.kernel.org,
	borntraeger@de.ibm.com, iommu@lists.linux-foundation.org,
	schwidefsky@de.ibm.com, robin.murphy@arm.com, gerald.schaefer@de.ibm.com
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

On Fri, 17 May 2019 18:16:50 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> We implement the capability interface for VFIO_IOMMU_GET_INFO.
> 
> When calling the ioctl, the user must specify
> VFIO_IOMMU_INFO_CAPABILITIES to retrieve the capabilities and
> must check in the answer if capabilities are supported.
> 
> The iommu get_attr callback will be used to retrieve the specific
> attributes and fill the capabilities.
> 
> Currently two Z-PCI specific capabilities will be queried and
> filled by the underlying Z specific s390_iommu:
> VFIO_IOMMU_INFO_CAP_QFN for the PCI query function attributes
> and
> VFIO_IOMMU_INFO_CAP_QGRP for the PCI query function group.
> 
> Other architectures may add new capabilities in the same way
> after enhancing the architecture specific IOMMU driver.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 122 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 121 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index d0f731c..9435647 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -1658,6 +1658,97 @@ static int vfio_domains_have_iommu_cache(struct vfio_iommu *iommu)
>  	return ret;
>  }
>  
> +static int vfio_iommu_type1_zpci_fn(struct iommu_domain *domain,
> +				    struct vfio_info_cap *caps, size_t size)
> +{
> +	struct vfio_iommu_type1_info_pcifn *info_fn;
> +	int ret;
> +
> +	info_fn = kzalloc(size, GFP_KERNEL);
> +	if (!info_fn)
> +		return -ENOMEM;
> +
> +	ret = iommu_domain_get_attr(domain, DOMAIN_ATTR_ZPCI_FN,
> +				    &info_fn->response);

What ensures that the 'struct clp_rsp_query_pci' returned from this
get_attr remains consistent with a 'struct vfio_iommu_pci_function'?
Why does the latter contains so many reserved fields (beyond simply
alignment) for a user API?  What fields of these structures are
actually useful to userspace?  Should any fields not be exposed to the
user?  Aren't BAR sizes redundant to what's available through the vfio
PCI API?  I'm afraid that simply redefining an internal structure as
the API leaves a lot to be desired too.  Thanks,

Alex

> +	if (ret < 0)
> +		goto free_fn;
> +
> +	info_fn->header.id = VFIO_IOMMU_INFO_CAP_QFN;
> +	ret = vfio_info_add_capability(caps, &info_fn->header, size);
> +
> +free_fn:
> +	kfree(info_fn);
> +	return ret;
> +}
> +
> +static int vfio_iommu_type1_zpci_grp(struct iommu_domain *domain,
> +				     struct vfio_info_cap *caps,
> +				     size_t grp_size)
> +{
> +	struct vfio_iommu_type1_info_pcifg *info_grp;
> +	int ret;
> +
> +	info_grp = kzalloc(grp_size, GFP_KERNEL);
> +	if (!info_grp)
> +		return -ENOMEM;
> +
> +	ret = iommu_domain_get_attr(domain, DOMAIN_ATTR_ZPCI_GRP,
> +				    (void *) &info_grp->response);
> +	if (ret < 0)
> +		goto free_grp;
> +	info_grp->header.id = VFIO_IOMMU_INFO_CAP_QGRP;
> +	ret = vfio_info_add_capability(caps, &info_grp->header, grp_size);
> +
> +free_grp:
> +	kfree(info_grp);
> +	return ret;
> +}
> +
> +int vfio_iommu_type1_caps(struct vfio_iommu *iommu, struct vfio_info_cap *caps,
> +			  size_t size)
> +{
> +	struct vfio_domain *d;
> +	unsigned long total_size, fn_size, grp_size;
> +	int ret;
> +
> +	d = list_first_entry(&iommu->domain_list, struct vfio_domain, next);
> +	if (!d)
> +		return -ENODEV;
> +
> +	/* First compute the size the user must provide */
> +	total_size = 0;
> +	fn_size = iommu_domain_get_attr(d->domain,
> +					DOMAIN_ATTR_ZPCI_FN_SIZE, NULL);
> +	if (fn_size > 0) {
> +		fn_size +=  sizeof(struct vfio_info_cap_header);
> +		total_size += fn_size;
> +	}
> +
> +	grp_size = iommu_domain_get_attr(d->domain,
> +					 DOMAIN_ATTR_ZPCI_GRP_SIZE, NULL);
> +	if (grp_size > 0) {
> +		grp_size +=  sizeof(struct vfio_info_cap_header);
> +		total_size += grp_size;
> +	}
> +
> +	if (total_size > size) {
> +		/* Tell caller to call us with a greater buffer */
> +		caps->size = total_size;
> +		return 0;
> +	}
> +
> +	if (fn_size) {
> +		ret = vfio_iommu_type1_zpci_fn(d->domain, caps, fn_size);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (grp_size)
> +		ret = vfio_iommu_type1_zpci_grp(d->domain, caps, grp_size);
> +
> +	return ret;
> +}
> +
>  static long vfio_iommu_type1_ioctl(void *iommu_data,
>  				   unsigned int cmd, unsigned long arg)
>  {
> @@ -1679,6 +1770,8 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
>  		}
>  	} else if (cmd == VFIO_IOMMU_GET_INFO) {
>  		struct vfio_iommu_type1_info info;
> +		struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
> +		int ret;
>  
>  		minsz = offsetofend(struct vfio_iommu_type1_info, iova_pgsizes);
>  
> @@ -1688,7 +1781,34 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
>  		if (info.argsz < minsz)
>  			return -EINVAL;
>  
> -		info.flags = VFIO_IOMMU_INFO_PGSIZES;
> +		if (info.flags & VFIO_IOMMU_INFO_CAPABILITIES) {
> +			minsz = offsetofend(struct vfio_iommu_type1_info,
> +					    cap_offset);
> +			if (info.argsz < minsz)
> +				return -EINVAL;
> +			ret = vfio_iommu_type1_caps(iommu, &caps,
> +						    info.argsz - sizeof(info));
> +			if (ret)
> +				return ret;
> +		}
> +		if (caps.size) {
> +			if (info.argsz < sizeof(info) + caps.size) {
> +				info.argsz = sizeof(info) + caps.size;
> +				info.cap_offset = 0;
> +			} else {
> +				if (copy_to_user((void __user *)arg +
> +						 sizeof(info), caps.buf,
> +						 caps.size)) {
> +					kfree(caps.buf);
> +					return -EFAULT;
> +				}
> +
> +				info.cap_offset = sizeof(info);
> +			}
> +			kfree(caps.buf);
> +		}
> +
> +		info.flags |= VFIO_IOMMU_INFO_PGSIZES;
>  
>  		info.iova_pgsizes = vfio_pgsize_bitmap(iommu);
>  

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
