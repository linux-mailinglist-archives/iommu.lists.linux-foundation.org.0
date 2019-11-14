Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D10CFAA96
	for <lists.iommu@lfdr.de>; Wed, 13 Nov 2019 08:03:25 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D3CC1C84;
	Wed, 13 Nov 2019 07:03:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 61519C59
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 07:03:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BF85ECF
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 07:03:18 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3AA5868C4E; Wed, 13 Nov 2019 08:03:13 +0100 (CET)
Date: Wed, 13 Nov 2019 08:03:12 +0100
From: Christoph Hellwig <hch@lst.de>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 02/10] iommu/vt-d: Use per-device dma_ops
Message-ID: <20191113070312.GA2735@lst.de>
References: <20190725031717.32317-1-baolu.lu@linux.intel.com>
	<20190725031717.32317-3-baolu.lu@linux.intel.com>
	<20190725054413.GC24527@lst.de>
	<bc831f88-5b19-7531-00aa-a7577dd5c1ac@linux.intel.com>
	<20190725114348.GA30957@lst.de>
	<a098359a-0f89-6028-68df-9f83718df256@linux.intel.com>
	<20191112071640.GA3343@lst.de>
	<0885617e-8390-6d18-987f-40d49f9f563e@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0885617e-8390-6d18-987f-40d49f9f563e@linux.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alan.cox@intel.com, Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>, ashok.raj@intel.com,
	Jonathan Corbet <corbet@lwn.net>, pengfei.xu@intel.com,
	Ingo Molnar <mingo@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, kevin.tian@intel.com,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	mika.westerberg@linux.intel.com, Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	jacob.jun.pan@intel.com, Robin Murphy <robin.murphy@arm.com>
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

On Wed, Nov 13, 2019 at 10:50:27AM +0800, Lu Baolu wrote:
> Currently, this is a block issue for using per-device dma ops in Intel
> IOMMU driver. Hence block this driver from using the generic iommu dma
> ops.

That is in fact the reason why I bring it up :)

> I'd like to align Intel IOMMU driver with other vendors. Use iommu dma
> ops for devices which have been selected to go through iommu. And use
> direct dma ops if selected to by pass.
>
> One concern of this propose is that for devices with limited address
> capability, shall we force it to use iommu or alternatively use swiotlb
> if user decides to let it by pass iommu.
>
> I understand that using swiotlb will cause some overhead due to the
> bounced buffer, but Intel IOMMU is default on hence any users who use a
> default kernel won't suffer this. We only need to document this so that
> users understand this overhead when they decide to let such devices by
> pass iommu. This is common to all vendor iommu drivers as far as I can
> see.

Indeed.  And one idea would be to lift the code in the powerpc
dma_iommu_ops that check a flag and use the direct ops to the generic
dma code and a flag in struct device.  We can then switch the intel
iommu ops (and AMD Gart) over to it.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
