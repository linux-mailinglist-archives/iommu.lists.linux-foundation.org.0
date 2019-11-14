Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EA31AFBF46
	for <lists.iommu@lfdr.de>; Thu, 14 Nov 2019 06:17:21 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AD5FCAE7;
	Thu, 14 Nov 2019 05:17:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AA90AAC7
	for <iommu@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 05:17:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B81534C3
	for <iommu@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 05:17:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2019 21:17:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; d="scan'208";a="229995322"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga004.fm.intel.com with ESMTP; 13 Nov 2019 21:17:08 -0800
Subject: Re: [PATCH v5 02/10] iommu/vt-d: Use per-device dma_ops
To: Christoph Hellwig <hch@lst.de>
References: <20190725031717.32317-1-baolu.lu@linux.intel.com>
	<20190725031717.32317-3-baolu.lu@linux.intel.com>
	<20190725054413.GC24527@lst.de>
	<bc831f88-5b19-7531-00aa-a7577dd5c1ac@linux.intel.com>
	<20190725114348.GA30957@lst.de>
	<a098359a-0f89-6028-68df-9f83718df256@linux.intel.com>
	<20191112071640.GA3343@lst.de>
	<0885617e-8390-6d18-987f-40d49f9f563e@linux.intel.com>
	<20191113070312.GA2735@lst.de> <20191113095353.GA5937@lst.de>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <0ddc8aff-783a-97b9-f5cc-9e27990de278@linux.intel.com>
Date: Thu, 14 Nov 2019 13:14:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113095353.GA5937@lst.de>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
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

On 11/13/19 5:53 PM, Christoph Hellwig wrote:
> On Wed, Nov 13, 2019 at 08:03:12AM +0100, Christoph Hellwig wrote:
>> Indeed.  And one idea would be to lift the code in the powerpc
>> dma_iommu_ops that check a flag and use the direct ops to the generic
>> dma code and a flag in struct device.  We can then switch the intel
>> iommu ops (and AMD Gart) over to it.
> 
> Let me know what you think of the branch below.  Only compile tested
> and booted on qemu with an emulated intel iommu:
> 
> 	http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-bypass
> 

I took a quick look at the related patches on the branch. Most of them
look good to me. But I would like to understand more about below logic.

static int intel_dma_supported(struct device *dev, u64 mask)
{
	struct device_domain_info *info = dev->archdata.iommu;
	int ret;

	ret = dma_direct_supported(dev, mask);
	if (ret < 0)
		return ret;

	if (!info || info == DUMMY_DEVICE_DOMAIN_INFO ||
			info == DEFER_DEVICE_DOMAIN_INFO) {
		dev->dma_ops_bypass = true;
	} else if (info->domain == si_domain) {
		if (mask < dma_direct_get_required_mask(dev)) {
			dev->dma_ops_bypass = false;
			intel_iommu_set_dma_domain(dev);
			dev_info(dev, "32bit DMA uses non-identity mapping\n");
		} else {
			dev->dma_ops_bypass = true;
		}
	} else {
		dev->dma_ops_bypass = false;
	}

	return 0;
}

Could you please educate me what dma_supported() is exactly for? Will
it always get called during boot? When will it be called?

In above implementation, why do we need to check dma_direct_supported()
at the beginning? And why

	if (!info || info == DUMMY_DEVICE_DOMAIN_INFO ||
			info == DEFER_DEVICE_DOMAIN_INFO) {
		dev->dma_ops_bypass = true;

Best regards,
baolu

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
