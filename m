Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B09E374902
	for <lists.iommu@lfdr.de>; Wed,  5 May 2021 22:02:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3E2D40522;
	Wed,  5 May 2021 20:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8SHowitVTtdI; Wed,  5 May 2021 20:02:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id A99614056D;
	Wed,  5 May 2021 20:02:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76EBCC0001;
	Wed,  5 May 2021 20:02:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5557C0001
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 20:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8963160A67
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 20:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kzJ69E5nQOLq for <iommu@lists.linux-foundation.org>;
 Wed,  5 May 2021 20:01:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC54460713
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 20:01:58 +0000 (UTC)
IronPort-SDR: Wytp87IRaDePiIX3+O9+5wrEhDXTyKXCbklMMMlQdjsgBr72ZGB3Wh+kjTSUa2uJjFfZgg1cmR
 QzWAeWl/0Qfg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="185759255"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="185759255"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 13:01:56 -0700
IronPort-SDR: VI2pDIaJ4hHcNspdA1bLZ4OSjm/y7q0dqAdAfbQxIZJ/+0aNwNizzDu2jRjKs8XwRsR7nUF658
 AYEPooNFtQVg==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="406682561"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 13:01:56 -0700
Date: Wed, 5 May 2021 13:04:46 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and
 allocation APIs
Message-ID: <20210505130446.3ee2fccd@jacob-builder>
In-Reply-To: <20210505180023.GJ1370958@nvidia.com>
References: <MWHPR11MB1886E688D2128C98A1F240B18C459@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210423114944.GF1370958@nvidia.com>
 <MWHPR11MB18861FE6982D73AFBF173E048C439@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210426123817.GQ1370958@nvidia.com>
 <MWHPR11MB188625137D5B7423822396C88C409@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210504084148.4f61d0b5@jacob-builder>
 <20210504180050.GB1370958@nvidia.com>
 <20210504151154.02908c63@jacob-builder>
 <20210504231530.GE1370958@nvidia.com>
 <20210505102259.044cafdf@jacob-builder>
 <20210505180023.GJ1370958@nvidia.com>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>, Li Zefan <lizefan@huawei.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Wu, 
 Hao" <hao.wu@intel.com>, David Woodhouse <dwmw2@infradead.org>
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

Hi Jason,

On Wed, 5 May 2021 15:00:23 -0300, Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, May 05, 2021 at 10:22:59AM -0700, Jacob Pan wrote:
> 
> > Global and pluggable are for slightly separate reasons.
> > - We need global PASID on VT-d in that we need to support shared
> > workqueues (SWQ). E.g. One SWQ can be wrapped into two mdevs then
> > assigned to two VMs. Each VM uses its private guest PASID to submit
> > work but each guest PASID must be translated to a global (system-wide)
> > host PASID to avoid conflict. Also, since PASID table storage is per
> > PF, if two mdevs of the same PF are assigned to different VMs, the
> > PASIDs must be unique.  
> 
> From a protocol perspective each RID has a unique PASID table, and
> RIDs can have overlapping PASIDs.
> 
True, per RID or per PF as I was referring to.

> Since your SWQ is connected to a single RID the requirement that
> PASIDs are unique to the RID ensures they are sufficiently unique.
> 
True, but one process can submit work to multiple mdevs from different
RIDs/PFs. One process uses one PASID and PASID translation table is per VM.
The same PASID is used for all the PASID tables of each RID.

For example:
VM1 has two mdevs: mdev1 and mdev2. mdev1's parent is RID1, mdev2's parent
is RID2. The guest process A allocates PASID_A and bind to both mdev1 and
mdev2. PASID_A must be present in the PASID tables for both RID1 and RID2.

If the allocator is per RID, it is not possible to ensure PASID_A is
available for both RIDs. Right?

Sorry I missed this point in my earlier explanation.

> If the IOMMU driver has additional restrictions then it should raise
> the PASID table up higher in the hierarchy than at the RID.
> 
That higher level in the hierarchy is global, right? I am a little
concerned about expanding PASID table sharing from security perspective.
Even though, VMs already share PASID table for mdevs.

> I think what you are trying to explain is that the Intel vIOMMU has a
> single PASID address space shared globally by the vCPU because ENQCMD
> uses the global vGPU translation table.
> 
Yes, PASID translation table is per VM, global in terms of the guest.
That combined with the case of two mdevs from different RIDs can be used by
the same guest process/PASID requires global PASID.

> That is fine, but all this stuff should be inside the Intel vIOMMU
> driver not made into a global resource of the entire iommu subsystem.
> 
Intel vIOMMU has to use a generic uAPI to allocate PASID so the generic
code need to have this option. I guess you are saying we should also have a
per RID allocation option in addition to global?

> Systems that work this way just cannot have multiple iommu drivers
> competing for PASID.
> 
Sorry, I am not following. There would not be mixed iommu drivers on one
platform, I must have missed your point. Could you explain a little?

> > - The pluggable allocator is to support the option where the guest
> > PASIDs are allocated by the hypervisor.   
> 
> And if the hypervisor allocates the PASID then again the specific
> vIOMMU itself is concerned with this and it has nothing to do with
> global behavior of the iommu subsystem.
> 
> > For ARM, since the guest owns the per device PASID table. There is no
> > need to allocate PASIDs from the host nor the hypervisor. Without SWQ,
> > there is no need for global PASID/SSID either. So PASID being global
> > for ARM is for simplicity in case of host PASID/SSID.  
> 
> It isn't clear how ARM can support PASID and mdev but that is an
> unrelated issue..
> 
AFAIK, the current SMMU device assignment is per RID, since only one stage2
page tables per RID, not per PASID. This is equivalent to the older VT-d
spec. prior to scalable mode.

Eric/Jean, can you help?

> Jason


Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
