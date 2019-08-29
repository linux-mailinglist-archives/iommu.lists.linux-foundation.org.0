Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8859BA0F01
	for <lists.iommu@lfdr.de>; Thu, 29 Aug 2019 03:45:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 38A7643C9;
	Thu, 29 Aug 2019 01:45:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9435443C1
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 01:44:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2C26CEC
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 01:44:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2019 18:44:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="380606108"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2019 18:44:48 -0700
Subject: Re: [RFC PATCH] iommu/vt-d: Fix IOMMU field not populated on device
	hot re-plug
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20190822142922.31526-1-janusz.krzysztofik@linux.intel.com>
	<29020717.Hl6jQjRASr@jkrzyszt-desk.ger.corp.intel.com>
	<8f505c10-6256-c561-1aea-b3817388c5b2@linux.intel.com>
	<3275480.HMaYE7B3nd@jkrzyszt-desk.ger.corp.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <0cf4e930-1132-1e7f-815b-57a08a1fe5de@linux.intel.com>
Date: Thu, 29 Aug 2019 09:43:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3275480.HMaYE7B3nd@jkrzyszt-desk.ger.corp.intel.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	=?UTF-8?Q?Micha=c5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
	David Woodhouse <dwmw2@infradead.org>, intel-gfx@lists.freedesktop.org
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

Hi Janusz,

On 8/28/19 10:17 PM, Janusz Krzysztofik wrote:
>> We should avoid kernel panic when a intel_unmap() is called against
>> a non-existent domain.
> Does that mean you suggest to replace
> 	BUG_ON(!domain);
> with something like
> 	if (WARN_ON(!domain))
> 		return;
> and to not care of orphaned mappings left allocated?  Is there a way to inform
> users that their active DMA mappings are no longer valid and they shouldn't
> call dma_unmap_*()?
> 
>> But we shouldn't expect the IOMMU driver not
>> cleaning up the domain info when a device remove notification comes and
>> wait until all file descriptors being closed, right?
> Shouldn't then the IOMMU driver take care of cleaning up resources still
> allocated on device remove before it invalidates and forgets their pointers?
> 

You are right. We need to wait until all allocated resources (iova and
mappings) to be released.

How about registering a callback for BUS_NOTIFY_UNBOUND_DRIVER, and
removing the domain info when the driver detachment completes?

> Thanks,
> Janusz

Best regards,
Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
