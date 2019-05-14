Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D81C723
	for <lists.iommu@lfdr.de>; Tue, 14 May 2019 12:43:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6FA2FDBC;
	Tue, 14 May 2019 10:43:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 22E4DDB2
	for <iommu@lists.linux-foundation.org>;
	Tue, 14 May 2019 10:43:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id D2AD142D
	for <iommu@lists.linux-foundation.org>;
	Tue, 14 May 2019 10:43:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B12B8374;
	Tue, 14 May 2019 03:43:09 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 122D93F703;
	Tue, 14 May 2019 03:43:07 -0700 (PDT)
Subject: Re: [PATCH v3 02/16] iommu: Introduce cache_invalidate API
To: Auger Eric <eric.auger@redhat.com>,
	Jacob Pan <jacob.jun.pan@linux.intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, 
	LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <1556922737-76313-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1556922737-76313-3-git-send-email-jacob.jun.pan@linux.intel.com>
	<d32d3d19-11c9-4af9-880b-bb8ebefd4f7f@redhat.com>
	<44d5ba37-a9e9-cc7a-2a3a-d32b840afa29@arm.com>
	<7807afe9-efab-9f48-4ca0-2332a7a54950@redhat.com>
	<1a5a5fad-ed21-5c79-9a9e-ff21fadfb95f@arm.com>
	<1edd45e6-4da3-e393-36b2-9e63cd5f7607@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <4094baf1-6cf5-a33b-4717-08ced0673c50@arm.com>
Date: Tue, 14 May 2019 11:42:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1edd45e6-4da3-e393-36b2-9e63cd5f7607@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Raj Ashok <ashok.raj@intel.com>
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

On 14/05/2019 08:46, Auger Eric wrote:
> Hi Jean,
> 
> On 5/13/19 7:09 PM, Jean-Philippe Brucker wrote:
>> On 13/05/2019 17:50, Auger Eric wrote:
>>>> struct iommu_inv_pasid_info {
>>>> #define IOMMU_INV_PASID_FLAGS_PASID	(1 << 0)
>>>> #define IOMMU_INV_PASID_FLAGS_ARCHID	(1 << 1)
>>>> 	__u32	flags;
>>>> 	__u32	archid;
>>>> 	__u64	pasid;
>>>> };
>>> I agree it does the job now. However it looks a bit strange to do a
>>> PASID based invalidation in my case - SMMUv3 nested stage - where I
>>> don't have any PASID involved.
>>>
>>> Couldn't we call it context based invalidation then? A context can be
>>> tagged by a PASID or/and an ARCHID.
>>
>> I think calling it "context" would be confusing as well (I shouldn't
>> have used it earlier), since VT-d uses that name for device table
>> entries (=STE on Arm SMMU). Maybe "addr_space"?
> yes you're right. Well we already pasid table table terminology so we
> can use it here as well - as long as we understand what purpose it
> serves ;-) - So OK for iommu_inv_pasid_info.
> 
> I think Jean understood we would keep pasid standalone field in
> iommu_cache_invalidate_info's union. I understand the struct
> iommu_inv_pasid_info now would replace it, correct?

Yes

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
