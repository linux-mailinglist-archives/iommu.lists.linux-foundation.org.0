Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3573EA4F98
	for <lists.iommu@lfdr.de>; Mon,  2 Sep 2019 09:17:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4B34CAD1;
	Mon,  2 Sep 2019 07:17:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8CF43504
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 07:17:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 34FF1709
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 07:17:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Sep 2019 00:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; d="scan'208";a="381777869"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga005.fm.intel.com with ESMTP; 02 Sep 2019 00:16:57 -0700
Subject: Re: [PATCH v8 7/7] iommu/vt-d: Use bounce buffer for untrusted devices
To: David Laight <David.Laight@ACULAB.COM>,
	David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>
References: <20190830071718.16613-1-baolu.lu@linux.intel.com>
	<20190830071718.16613-8-baolu.lu@linux.intel.com>
	<4dee1bcef8474ebb95a7826a58bb72aa@AcuMS.aculab.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <90de3797-d961-a3e5-36c9-d8328a3faab0@linux.intel.com>
Date: Mon, 2 Sep 2019 15:15:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4dee1bcef8474ebb95a7826a58bb72aa@AcuMS.aculab.com>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"ashok.raj@intel.com" <ashok.raj@intel.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	"alan.cox@intel.com" <alan.cox@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, Robin Murphy <robin.murphy@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"pengfei.xu@intel.com" <pengfei.xu@intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	"jacob.jun.pan@intel.com" <jacob.jun.pan@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
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

Hi David,

On 8/30/19 9:39 PM, David Laight wrote:
> From: Lu Baolu
>> Sent: 30 August 2019 08:17
> 
>> The Intel VT-d hardware uses paging for DMA remapping.
>> The minimum mapped window is a page size. The device
>> drivers may map buffers not filling the whole IOMMU
>> window. This allows the device to access to possibly
>> unrelated memory and a malicious device could exploit
>> this to perform DMA attacks. To address this, the
>> Intel IOMMU driver will use bounce pages for those
>> buffers which don't fill whole IOMMU pages.
> 
> Won't this completely kill performance?
> 
> I'd expect to see something for dma_alloc_coherent() (etc)
> that tries to give the driver page sized buffers.

Bounce page won't be used if driver request page sized buffers.

> 
> Either that or the driver could allocate page sized buffers
> even though it only passes fragments of these buffers to
> the dma functions (to avoid excessive cache invalidates).

Yes, agreed. One possible solution is to add a dma attribution and the
device driver could hint that the buffer under mapping is part of a page
sized buffer and iommu driver don't need to use bounce buffer for it.
This is in the todo list. We need to figure out which device driver
really needs this.

> 
> Since you have to trust the driver, why not actually trust it?
> 

In thunderbolt case, we trust driver, but we don't trust the hot-added
devices.

Best regards,
Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
