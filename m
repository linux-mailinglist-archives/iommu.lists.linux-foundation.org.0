Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FF0276DFD
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 11:55:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B5C0D869ED;
	Thu, 24 Sep 2020 09:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vT4MCEYXRvmT; Thu, 24 Sep 2020 09:55:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 55300869EA;
	Thu, 24 Sep 2020 09:55:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E839C0051;
	Thu, 24 Sep 2020 09:55:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4ED6C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 09:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C3B18869EA
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 09:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWwV6Ces0l0F for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 09:55:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 49EEE869BE
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 09:55:36 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id EAEBB295; Thu, 24 Sep 2020 11:55:33 +0200 (CEST)
Date: Thu, 24 Sep 2020 11:55:32 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 0/5] iommu aux-domain APIs extensions
Message-ID: <20200924095532.GK27174@8bytes.org>
References: <20200922061042.31633-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922061042.31633-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Sep 22, 2020 at 02:10:37PM +0800, Lu Baolu wrote:
> Hi Jorge and Alex,
> 
> A description of this patch series could be found here.
> 
> https://lore.kernel.org/linux-iommu/20200901033422.22249-1-baolu.lu@linux.intel.com/

Hmm, I am wondering if we can avoid all this hassle and special APIs by
making the mdev framework more visible outside of the vfio code. There
is an underlying bus implementation for mdevs, so is there a reason
those can't use the standard iommu-core code to setup IOMMU mappings?

What speaks against doing:

	- IOMMU drivers capable of handling mdevs register iommu-ops
	  for the mdev_bus.

	- iommu_domain_alloc() takes bus_type as parameter, so there can
	  be special domains be allocated for mdevs.

	- Group creation and domain allocation will happen
	  automatically in the iommu-core when a new mdev is registered
	  through device-driver core code.

	- There should be no need for special iommu_aux_* APIs, as one
	  can attach a domain directly to &mdev->dev with
	  iommu_attach_device(domain, &mdev->dev).

Doing it this way will probably also keep the mdev-special code in VFIO
small.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
