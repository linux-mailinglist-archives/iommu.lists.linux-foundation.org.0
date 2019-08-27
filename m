Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 839249F653
	for <lists.iommu@lfdr.de>; Wed, 28 Aug 2019 00:46:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0A3E11D28;
	Tue, 27 Aug 2019 22:46:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 23FF81B70
	for <iommu@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 22:05:15 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C7EB088E
	for <iommu@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 22:05:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Aug 2019 14:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,438,1559545200"; d="scan'208";a="381075305"
Received: from unknown (HELO localhost.localdomain) ([10.232.112.69])
	by fmsmga006.fm.intel.com with ESMTP; 27 Aug 2019 14:58:08 -0700
Date: Tue, 27 Aug 2019 15:56:22 -0600
From: Keith Busch <kbusch@kernel.org>
To: "Derrick, Jonathan" <jonathan.derrick@intel.com>
Subject: Re: [PATCH] vmd: Stop overriding dma_map_ops
Message-ID: <20190827215621.GB23412@localhost.localdomain>
References: <20190826150652.10316-1-hch@lst.de>
	<8cad7eb5b5b37aeb041fd0c464383bb5223e4a64.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cad7eb5b5b37aeb041fd0c464383bb5223e4a64.camel@intel.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Tue, 27 Aug 2019 22:46:02 +0000
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Busch, Keith" <keith.busch@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>, "hch@lst.de" <hch@lst.de>
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

On Tue, Aug 27, 2019 at 11:24:05AM -0700, Derrick, Jonathan wrote:
> On Mon, 2019-08-26 at 17:06 +0200, Christoph Hellwig wrote:
> > With a little tweak to the intel-iommu code we should be able to work
> > around the VMD mess for the requester IDs without having to create giant
> > amounts of boilerplate DMA ops wrapping code.  The other advantage of
> > this scheme is that we can respect the real DMA masks for the actual
> > devices, and I bet it will only be a matter of time until we'll see the
> > first DMA challeneged NVMe devices.
> > 
> > The only downside is that we can't offer vmd as a module given that
> > intel-iommu calls into it.  But the driver only has about 700 lines
> > of code, so this should not be a major issue.
> If we're going to remove its ability to be a module, and given its
> small size, could we make this default =y?
> 
> Otherwise we risk breaking platforms which have it enabled with OSVs
> who miss enabling it

Can we keep this as a module if we stick the remapping struct device
in pci_sysdata instead of going through the vmd driver to get it?

Otherwise, very happy to see this dma wrapping go away.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
