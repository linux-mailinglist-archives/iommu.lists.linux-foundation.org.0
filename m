Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7504A4259B9
	for <lists.iommu@lfdr.de>; Thu,  7 Oct 2021 19:46:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA35D409DA;
	Thu,  7 Oct 2021 17:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cKso-fbW76dL; Thu,  7 Oct 2021 17:46:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 01D08409D3;
	Thu,  7 Oct 2021 17:46:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D31B3C000D;
	Thu,  7 Oct 2021 17:46:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DB7AC000D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Oct 2021 17:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 624984036F
 for <iommu@lists.linux-foundation.org>; Thu,  7 Oct 2021 17:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sN1-ty3-Za0A for <iommu@lists.linux-foundation.org>;
 Thu,  7 Oct 2021 17:46:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13BAB4020A
 for <iommu@lists.linux-foundation.org>; Thu,  7 Oct 2021 17:46:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="226221530"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="226221530"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 10:46:25 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="478659965"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 10:46:25 -0700
Date: Thu, 7 Oct 2021 10:50:10 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC 0/7] Support in-kernel DMA with PASID and SVA
Message-ID: <20211007105010.33d706cf@jacob-builder>
In-Reply-To: <20211007115918.GH2744544@nvidia.com>
References: <1632256181-36071-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <CAGsJ_4z=2y2nVStXP-aAPnQrJJbMmv78mjaMwNc9P9Ec+gCtGw@mail.gmail.com>
 <20211001123623.GM964074@nvidia.com>
 <CAGsJ_4wfkrJp-eFKiXsLdiZCb3eS_zqZtJvXQTBafoTWY2yWKQ@mail.gmail.com>
 <20211004094003.527222e5@jacob-builder>
 <20211004182142.GM964074@nvidia.com>
 <CAGsJ_4w+ed78cnJusM_enEZpdGghzvjgt0aYDPpfwk4z7PQqxQ@mail.gmail.com>
 <20211007113221.GF2744544@nvidia.com>
 <CAGsJ_4x2UEmNXCVhJAVRyB8568VMrTkOLeVCNp8CyP6xZJwCig@mail.gmail.com>
 <20211007115918.GH2744544@nvidia.com>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Raj Ashok <ashok.raj@intel.com>, "Kumar,
 Sanjay K" <sanjay.k.kumar@intel.com>, Barry Song <21cnbao@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, mike.campin@intel.com
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

On Thu, 7 Oct 2021 08:59:18 -0300, Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Fri, Oct 08, 2021 at 12:54:52AM +1300, Barry Song wrote:
> > On Fri, Oct 8, 2021 at 12:32 AM Jason Gunthorpe <jgg@nvidia.com> wrote:
> >  
> > >
> > > On Thu, Oct 07, 2021 at 06:43:33PM +1300, Barry Song wrote:
> > >  
> > > > So do we have a case where devices can directly access the kernel's
> > > > data structure such as a list/graph/tree with pointers to a kernel
> > > > virtual address? then devices don't need to translate the address
> > > > of pointers in a structure. I assume this is one of the most useful
> > > > features userspace SVA can provide.  
> > >
> > > AFIACT that is the only good case for KVA, but it is also completely
> > > against the endianess, word size and DMA portability design of the
> > > kernel.
> > >
> > > Going there requires some new set of portable APIs for gobally
> > > coherent KVA dma.  
> > 
> > yep. I agree. it would be very weird if accelerators/gpu are sharing
> > kernel' data struct, but for each "DMA" operation - reading or writing
> > the data struct, we have to call dma_map_single/sg or
> > dma_sync_single_for_cpu/device etc. It seems once devices and cpus
> > are sharing virtual address(SVA), code doesn't need to do explicit
> > map/sync each time.  
> 
That is what we have today with sva_bind_device.
> No, it still need to do something to manage visibility from the
> current CPU to the DMA - it might not be flushing a cache, but it is
> probably a arch specific CPU barrier instruction.
> 
Are you talking about iommu_dma_sync_single_for_cpu(), this is not SVA
specific, right?

On platforms that are DMA snooped, this barrier is not needed. But I think
your point is that once we convert to DMA API, the sync/barrier is covered
by DMA APIs if !dev_is_dma_coherent(dev). Then all archs are good.

We could also add a check for dev_is_dma_coherent(dev) before using SVA.

> Jason


Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
