Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4431121B0
	for <lists.iommu@lfdr.de>; Wed,  4 Dec 2019 04:01:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0941E20425;
	Wed,  4 Dec 2019 03:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQVL6fd06mF0; Wed,  4 Dec 2019 03:01:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9E2022041E;
	Wed,  4 Dec 2019 03:01:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91C4FC1DE2;
	Wed,  4 Dec 2019 03:01:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F03BC1798;
 Wed,  4 Dec 2019 03:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3DF5486DE6;
 Wed,  4 Dec 2019 03:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLW0_1wqfcna; Wed,  4 Dec 2019 03:01:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D4DDE86DE1;
 Wed,  4 Dec 2019 03:01:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 19:01:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,275,1571727600"; d="scan'208";a="385576029"
Received: from jpan9-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.254.106.153])
 by orsmga005.jf.intel.com with ESMTP; 03 Dec 2019 19:01:37 -0800
Date: Tue, 3 Dec 2019 19:01:36 -0800
From: "Jacob Pan (Jun)" <jacob.jun.pan@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [RFC 00/13] virtio-iommu on non-devicetree platforms
Message-ID: <20191203190136.00007171@intel.com>
In-Reply-To: <20191125180247.GD945122@lophozonia>
References: <20191122105000.800410-1-jean-philippe@linaro.org>
 <20191122160102.00004489@intel.com>
 <20191125180247.GD945122@lophozonia>
Organization: intel
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Cc: virtio-dev@lists.oasis-open.org, kevin.tian@intel.com,
 gregkh@linuxfoundation.org, linux-pci@vger.kernel.org, sudeep.holla@arm.com,
 rjw@rjwysocki.net, virtualization@lists.linux-foundation.org,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, mst@redhat.com, jacob.jun.pan@intel.com,
 guohanjun@huawei.com, bhelgaas@google.com, jasowang@redhat.com,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

Hi Jean,

Sorry for the delay, I was out last week. Comments inline below.

On Mon, 25 Nov 2019 19:02:47 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> On Fri, Nov 22, 2019 at 04:01:02PM -0800, Jacob Pan (Jun) wrote:
> > > (1) ACPI has one table per vendor (DMAR for Intel, IVRS for AMD
> > > and IORT for Arm). From my point of view IORT is easier to
> > > extend, since we just need to introduce a new node type. There
> > > are no dependencies to Arm in the Linux IORT driver, so it works
> > > well with CONFIG_X86. 
> > From my limited understanding, IORT and VIOT is to solve device
> > topology enumeration only? I am not sure how it can be expanded to
> > cover information beyond device topology. e.g. DMAR has NUMA
> > information and root port ATS, I guess they are not used today in
> > the guest but might be additions in the future.  
> 
> The PCI root-complex node of IORT has an ATS attribute, which we can
> already use. However its scope is the root complex, not individual
> root ports like with DMAR.
> 
> I'm not very familiar with NUMA, but it looks like we just need to
> specify a proximity domain in relation to the SRAT table, for each
> viommu? The SMMUv3 node in IORT has a 4-bytes "proximity domain"
> field for this. We can add the same to the VIOT virtio-iommu nodes
> later, since the structures are extensible.
> 
I think there the proximity domain is more for each assigned device
than vIOMMU. vIOMMU in the guest can have assigned devices belong to
different pIOMMU and proximity domains. If the guest owns the first
level page tables (gIOVA or SVA), we want to make sure page tables are
allocated from the close proximity domain.

My understanding is virtio IOMMU supports both virtio devices and
assigned devices. we could care less about the former in terms of NUMA.

In ACPI, we have _PXM method to retrieve device proximity domain. I
don't know if there is something equivalent or a generic way to get
_PXM information. I think VMM also need to make sure when an assigned
device is used with vIOMMU, there are some memory is allocated from the
device's proximity domain.

> But it might be better to keep the bare minimum information in the FW
> descriptor, and put the rest in the virtio-iommu. So yes topology
> enumeration is something the device cannot do itself (not fully that
> is, see (2)) but for the rest, virtio-iommu's PROBE request can
> provide details about each endpoint in relation to their physical
> IOMMU.
> 
> We could for example add a bit in a PROBE property saying that the
> whole path between the IOMMU and the endpoint supports ATS. For NUMA
> it might also be more interesting to have a finer granularity, since
> one viommu could be managing endpoints that are behind different
> physical IOMMUs. If in the future we want to allocate page tables
> close to the physical IOMMU for example, we might need to describe
> multiple NUMA nodes per viommu, using the PROBE request.
> 
Should we reinvent something for NUMA or use ACPI's SRAT, _PXM? I am
not sure how it is handled today in QEMU in terms of guest-host NUMA
proximity domain mapping.

> Thanks,
> Jean

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
