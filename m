Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D3086B29
	for <lists.iommu@lfdr.de>; Thu,  8 Aug 2019 22:11:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 76D3FCC8;
	Thu,  8 Aug 2019 20:11:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 60FC7CB2
	for <iommu@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 20:10:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 142C3829
	for <iommu@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 20:10:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8DD7B309BF02;
	Thu,  8 Aug 2019 20:10:58 +0000 (UTC)
Received: from x1.home (ovpn-116-99.phx2.redhat.com [10.3.116.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E254D608A7;
	Thu,  8 Aug 2019 20:10:57 +0000 (UTC)
Date: Thu, 8 Aug 2019 14:10:57 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 2/2] iommu/vt-d: Fix possible use-after-free of private
	domain
Message-ID: <20190808141057.1bce8495@x1.home>
In-Reply-To: <20190806001409.3293-2-baolu.lu@linux.intel.com>
References: <20190806001409.3293-1-baolu.lu@linux.intel.com>
	<20190806001409.3293-2-baolu.lu@linux.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 08 Aug 2019 20:10:58 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
	David Woodhouse <dwmw2@infradead.org>
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

On Tue,  6 Aug 2019 08:14:09 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> Multiple devices might share a private domain. One real example
> is a pci bridge and all devices behind it. When remove a private
> domain, make sure that it has been detached from all devices to
> avoid use-after-free case.
> 
> Cc: Ashok Raj <ashok.raj@intel.com>
> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Fixes: 942067f1b6b97 ("iommu/vt-d: Identify default domains replaced with private")
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---

Tested-by: Alex Williamson <alex.williamson@redhat.com>

>  drivers/iommu/intel-iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 37259b7f95a7..12d094d08c0a 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -4791,7 +4791,8 @@ static void __dmar_remove_one_dev_info(struct device_domain_info *info)
>  
>  	/* free the private domain */
>  	if (domain->flags & DOMAIN_FLAG_LOSE_CHILDREN &&
> -	    !(domain->flags & DOMAIN_FLAG_STATIC_IDENTITY))
> +	    !(domain->flags & DOMAIN_FLAG_STATIC_IDENTITY) &&
> +	    list_empty(&domain->devices))
>  		domain_exit(info->domain);
>  
>  	free_devinfo_mem(info);

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
