Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 16869BC226
	for <lists.iommu@lfdr.de>; Tue, 24 Sep 2019 09:00:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D82BEB6C;
	Tue, 24 Sep 2019 07:00:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 15F31AF0
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 07:00:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8BC3287D
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 07:00:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2019 00:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; d="scan'208";a="179391239"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by orsmga007.jf.intel.com with ESMTP; 24 Sep 2019 00:00:21 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
	FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Tue, 24 Sep 2019 00:00:20 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
	fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Tue, 24 Sep 2019 00:00:20 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
	SHSMSX105.ccr.corp.intel.com ([169.254.11.23]) with mapi id
	14.03.0439.000; Tue, 24 Sep 2019 15:00:16 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Raj, Ashok" <ashok.raj@intel.com>, Jacob Pan
	<jacob.jun.pan@linux.intel.com>
Subject: RE: [RFC PATCH 0/4] Use 1st-level for DMA remapping in guest
Thread-Topic: [RFC PATCH 0/4] Use 1st-level for DMA remapping in guest
Thread-Index: AQHVcgo/pYehEUSjBUSa7tc1tTv1E6c5H56AgAAQYQCAATS/kA==
Date: Tue, 24 Sep 2019 07:00:15 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D58D1F1@SHSMSX104.ccr.corp.intel.com>
References: <20190923122454.9888-1-baolu.lu@linux.intel.com>
	<20190923122715.53de79d0@jacob-builder>
	<20190923202552.GA21816@araj-mobl1.jf.intel.com>
In-Reply-To: <20190923202552.GA21816@araj-mobl1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDI0MDY1ZmQtZmVkMS00OWIxLTk1M2MtMzk1Mzg4YzU2Njk0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSkNrektGMXluVWZ1a1wvRkhnUm1mbVpcLzBTSUQyMHkyWFhoUlZvaG5BYThiRDVVV09tK3YrbU5sU3VIc2FsT2JQIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Kumar,
	Sanjay K" <sanjay.k.kumar@intel.com>, "Sun, Yi Y" <yi.y.sun@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
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

> From: Raj, Ashok
> Sent: Tuesday, September 24, 2019 4:26 AM
> 
> Hi Jacob
> 
> On Mon, Sep 23, 2019 at 12:27:15PM -0700, Jacob Pan wrote:
> > >
> > > In VT-d 3.0, scalable mode is introduced, which offers two level
> > > translation page tables and nested translation mode. Regards to
> > > GIOVA support, it can be simplified by 1) moving the GIOVA support
> > > over 1st-level page table to store GIOVA->GPA mapping in vIOMMU,
> > > 2) binding vIOMMU 1st level page table to the pIOMMU, 3) using
> pIOMMU
> > > second level for GPA->HPA translation, and 4) enable nested (a.k.a.
> > > dual stage) translation in host. Compared with current shadow GIOVA
> > > support, the new approach is more secure and software is simplified
> > > as we only need to flush the pIOMMU IOTLB and possible device-IOTLB
> > > when an IOVA mapping in vIOMMU is torn down.
> > >
> > >      .-----------.
> > >      |  vIOMMU   |
> > >      |-----------|                 .-----------.
> > >      |           |IOTLB flush trap |   QEMU    |
> > >      .-----------.    (unmap)      |-----------|
> > >      | GVA->GPA  |---------------->|           |
> > >      '-----------'                 '-----------'

GVA should be replaced by GIOVA in all the figures.

> > >      |           |                       |
> > >      '-----------'                       |
> > >            <------------------------------
> > >            |      VFIO/IOMMU
> > >            |  cache invalidation and
> > >            | guest gpd bind interfaces
> > >            v
> > For vSVA, the guest PGD bind interface will mark the PASID as guest
> > PASID and will inject page request into the guest. In FL gIOVA case, I
> > guess we are assuming there is no page fault for GIOVA. I will need to
> > add a flag in the gpgd bind such that any PRS will be auto responded
> > with invalid.
> 
> Is there real need to enforce this? I'm not sure if there is any
> limitation in the spec, and if so, can the guest check that instead?

Whether to allow page fault is not usage specific (GIOVA, GVA, etc.).
It's really about the device capability and IOMMU capability. VT-d
allows page fault on both levels. So we don't need enforce it. 

btw in the future we may need an interface to tell VFIO whether a
 device is 100% DMA-faultable thus pinning can be avoided. But for 
now I'm not sure how such knowledge can be retrieved w/o device 
specific knowledge. PCI PRI capability only indicates that the device 
supports page fault, but not that the device enables page fault on 
its every DMA access. Maybe we need a new bit in PRI capability for
such purpose.

> 
> Also i believe the idea is to overcommit PASID#0 such uses. Thought
> we had a capability to expose this to the vIOMMU as well. Not sure if this
> is already documented, if not should be up in the next rev.
> 
> 
> >
> > Also, native use of IOVA FL map is not to be supported? i.e. IOMMU API
> > and DMA API for native usage will continue to be SL only?
> > >      .-----------.
> > >      |  pIOMMU   |
> > >      |-----------|
> > >      .-----------.
> > >      | GVA->GPA  |<---First level
> > >      '-----------'
> > >      | GPA->HPA  |<---Scond level
> 
> s/Scond/Second
> 
> > >      '-----------'
> > >      '-----------'
> > >
> > > This patch series only aims to achieve the first goal, a.k.a using

first goal? then what are other goals? I didn't spot such information.

Also earlier you mentioned the new approach (nested) is more secure
than shadowing. why?

> > > first level translation for IOVA mappings in vIOMMU. I am sending
> > > it out for your comments. Any comments, suggestions and concerns are
> > > welcomed.
> > >
> >
> >
> > > Based-on-idea-by: Ashok Raj <ashok.raj@intel.com>
> > > Based-on-idea-by: Kevin Tian <kevin.tian@intel.com>
> > > Based-on-idea-by: Liu Yi L <yi.l.liu@intel.com>
> > > Based-on-idea-by: Lu Baolu <baolu.lu@linux.intel.com>
> > > Based-on-idea-by: Sanjay Kumar <sanjay.k.kumar@intel.com>
> > >
> > > Lu Baolu (4):
> > >   iommu/vt-d: Move domain_flush_cache helper into header
> > >   iommu/vt-d: Add first level page table interfaces
> > >   iommu/vt-d: Map/unmap domain with mmmap/mmunmap
> > >   iommu/vt-d: Identify domains using first level page table
> > >
> > >  drivers/iommu/Makefile             |   2 +-
> > >  drivers/iommu/intel-iommu.c        | 142 ++++++++++--
> > >  drivers/iommu/intel-pgtable.c      | 342
> > > +++++++++++++++++++++++++++++ include/linux/intel-iommu.h        |
> > > 31 ++- include/trace/events/intel_iommu.h |  60 +++++
> > >  5 files changed, 553 insertions(+), 24 deletions(-)
> > >  create mode 100644 drivers/iommu/intel-pgtable.c
> > >
> >
> > [Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
