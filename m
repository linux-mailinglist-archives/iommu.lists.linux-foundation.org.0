Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A6986325C5
	for <lists.iommu@lfdr.de>; Mon,  3 Jun 2019 02:42:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 98C61BA0;
	Mon,  3 Jun 2019 00:42:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2E071B5F
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 00:42:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5F20983A
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 00:42:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 17:42:39 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga004.jf.intel.com with ESMTP; 02 Jun 2019 17:42:35 -0700
Subject: Re: [PATCH v4 10/15] iommu/vt-d: Probe DMA-capable ACPI name space
	devices
To: Christoph Hellwig <hch@infradead.org>
References: <20190525054136.27810-1-baolu.lu@linux.intel.com>
	<20190525054136.27810-11-baolu.lu@linux.intel.com>
	<20190529061626.GA26055@infradead.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <23d9d04c-c3fd-716e-dd66-eb5119aad4f9@linux.intel.com>
Date: Mon, 3 Jun 2019 08:35:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529061626.GA26055@infradead.org>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, dima@arista.com,
	tmurphy@arista.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 5/29/19 2:16 PM, Christoph Hellwig wrote:
> On Sat, May 25, 2019 at 01:41:31PM +0800, Lu Baolu wrote:
>> Some platforms may support ACPI name-space enumerated devices
>> that are capable of generating DMA requests. Platforms which
>> support DMA remapping explicitly declares any such DMA-capable
>> ACPI name-space devices in the platform through ACPI Name-space
>> Device Declaration (ANDD) structure and enumerate them through
>> the Device Scope of the appropriate remapping hardware unit.
>>
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> 
> Isn't this something that should be handled through the IOMMU API so
> that it covers other IOMMU types as well?
> 
> How does this scheme compare to the one implemented in
> drivers/acpi/arm64/iort.c?
> 

This part of code was added to be compatible with the past.

Yes. I've ever thought about this. But these devices sit on the acpi bus
together with other devices which are not DMA-capable. And on some
platforms these devices exist on the pci bus as well.

Best regards,
Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
