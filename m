Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0CD35906
	for <lists.iommu@lfdr.de>; Wed,  5 Jun 2019 10:53:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0CFFDC97;
	Wed,  5 Jun 2019 08:53:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0708C2F
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 08:53:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 560E119B
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 08:52:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2019 01:52:58 -0700
X-ExtLoop1: 1
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by orsmga002.jf.intel.com with ESMTP; 05 Jun 2019 01:52:57 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
	FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server
	(TLS) id 14.3.408.0; Wed, 5 Jun 2019 01:51:47 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.137]) by
	SHSMSX105.ccr.corp.intel.com ([169.254.11.153]) with mapi id
	14.03.0415.000; Wed, 5 Jun 2019 16:51:45 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>, Jean-Philippe Brucker
	<jean-philippe.brucker@arm.com>
Subject: RE: [PATCH v2 2/4] iommu: Introduce device fault data
Thread-Topic: [PATCH v2 2/4] iommu: Introduce device fault data
Thread-Index: AQHVGhzpdp8RFw2/OU64MEW+KDLfp6aJ93gAgALLAvA=
Date: Wed, 5 Jun 2019 08:51:45 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CA6A9EE@SHSMSX104.ccr.corp.intel.com>
References: <20190603145749.46347-1-jean-philippe.brucker@arm.com>
	<20190603145749.46347-3-jean-philippe.brucker@arm.com>
	<20190603150842.11070cfd@jacob-builder>
In-Reply-To: <20190603150842.11070cfd@jacob-builder>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNWQ0ODQxZDgtOWQ2Ni00NTkxLThlZmItZTgyMzM0MTliZTNiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZWJVU25wanM3dHNndlwvK2pnS3RUQmdhcUQ1eFdERDZCXC9SVXhRY1V0bGZnRFlyakNsR01cL3NiSThVWHlWa0RLSSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "Raj,
	Ashok" <ashok.raj@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

> From: Jacob Pan
> Sent: Tuesday, June 4, 2019 6:09 AM
> 
> On Mon,  3 Jun 2019 15:57:47 +0100
> Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:
> 
> > +/**
> > + * struct iommu_fault_page_request - Page Request data
> > + * @flags: encodes whether the corresponding fields are valid and
> > whether this
> > + *         is the last page in group (IOMMU_FAULT_PAGE_REQUEST_*
> > values)
> > + * @pasid: Process Address Space ID
> > + * @grpid: Page Request Group Index
> > + * @perm: requested page permissions (IOMMU_FAULT_PERM_* values)
> > + * @addr: page address
> > + * @private_data: device-specific private information
> > + */
> > +struct iommu_fault_page_request {
> > +#define IOMMU_FAULT_PAGE_REQUEST_PASID_VALID	(1 << 0)
> > +#define IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE	(1 << 1)
> > +#define IOMMU_FAULT_PAGE_REQUEST_PRIV_DATA	(1 << 2)
> > +	__u32	flags;
> > +	__u32	pasid;
> > +	__u32	grpid;
> > +	__u32	perm;
> > +	__u64	addr;
> > +	__u64	private_data[2];
> > +};
> > +
> 
> Just a thought, for non-identity G-H PASID management. We could pass on
> guest PASID in PRQ to save a lookup in QEMU. In this case, QEMU
> allocate a GPASID for vIOMMU then a host PASID for pIOMMU. QEMU has a
> G->H lookup. When PRQ comes in to the pIOMMU with HPASID, IOMMU
> driver
> can retrieve GPASID from the bind data then report to the guest via
> VFIO. In this case QEMU does not need to do a H->G PASID lookup.
> 
> Should we add a gpasid field here? or we can add a flag and field
> later, up to you.
> 

Can private_data serve this purpose? It's better not introducing
gpasid awareness within host IOMMU driver. It is just a user-level
data associated with a PASID when binding happens. Kernel doesn't
care the actual meaning, simply record it and then return back to user 
space later upon device fault. Qemu interprets the meaning as gpasid
in its own context. otherwise usages may use it for other purpose.

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
