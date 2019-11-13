Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C87FA6E1
	for <lists.iommu@lfdr.de>; Wed, 13 Nov 2019 03:53:35 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A2D84C2C;
	Wed, 13 Nov 2019 02:53:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 82E94AE0
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 02:53:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0D7FA623
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 02:53:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Nov 2019 18:53:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,298,1569308400"; d="scan'208";a="229611856"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga004.fm.intel.com with ESMTP; 12 Nov 2019 18:53:23 -0800
Subject: Re: [PATCH v5 02/10] iommu/vt-d: Use per-device dma_ops
To: Christoph Hellwig <hch@lst.de>
References: <20190725031717.32317-1-baolu.lu@linux.intel.com>
	<20190725031717.32317-3-baolu.lu@linux.intel.com>
	<20190725054413.GC24527@lst.de>
	<bc831f88-5b19-7531-00aa-a7577dd5c1ac@linux.intel.com>
	<20190725114348.GA30957@lst.de>
	<a098359a-0f89-6028-68df-9f83718df256@linux.intel.com>
	<20191112071640.GA3343@lst.de>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <0885617e-8390-6d18-987f-40d49f9f563e@linux.intel.com>
Date: Wed, 13 Nov 2019 10:50:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112071640.GA3343@lst.de>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alan.cox@intel.com, Stefano Stabellini <sstabellini@kernel.org>,
	ashok.raj@intel.com, Jonathan Corbet <corbet@lwn.net>,
	pengfei.xu@intel.com, Ingo Molnar <mingo@redhat.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Christoph,

On 11/12/19 3:16 PM, Christoph Hellwig wrote:
> On Fri, Jul 26, 2019 at 09:56:51AM +0800, Lu Baolu wrote:
>> I think current code doesn't do the right thing. The user asks the iommu
>> driver to use identity domain for a device, but the driver force it back
>> to DMA domain because of the device address capability.
>>
>>> expensive.  I don't think that this change is a good idea, and even if
>>> we decide that this is a good idea after all that should be done in a
>>> separate prep patch that explains the rationale.
>>
>> Yes. Make sense.
> 
> Now that the bounce code has landed it might be good time to revisit
> this patch in isolation and with a better explanation.
> 

Yes. Thanks for bringing this up.

Currently, this is a block issue for using per-device dma ops in Intel
IOMMU driver. Hence block this driver from using the generic iommu dma
ops.

I'd like to align Intel IOMMU driver with other vendors. Use iommu dma
ops for devices which have been selected to go through iommu. And use
direct dma ops if selected to by pass.

One concern of this propose is that for devices with limited address
capability, shall we force it to use iommu or alternatively use swiotlb
if user decides to let it by pass iommu.

I understand that using swiotlb will cause some overhead due to the
bounced buffer, but Intel IOMMU is default on hence any users who use a
default kernel won't suffer this. We only need to document this so that
users understand this overhead when they decide to let such devices by
pass iommu. This is common to all vendor iommu drivers as far as I can
see.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
