Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7660A1F809
	for <lists.iommu@lfdr.de>; Wed, 15 May 2019 17:58:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2F34FC74;
	Wed, 15 May 2019 15:58:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8F8C6481
	for <iommu@lists.linux-foundation.org>;
	Wed, 15 May 2019 15:58:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 4852783A
	for <iommu@lists.linux-foundation.org>;
	Wed, 15 May 2019 15:58:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A615374;
	Wed, 15 May 2019 08:58:13 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16E9D3F703;
	Wed, 15 May 2019 08:58:09 -0700 (PDT)
Subject: Re: [PATCH v7 04/23] iommu: Introduce attach/detach_pasid_table API
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, joro@8bytes.org,
	alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
	yi.l.liu@intel.com, will.deacon@arm.com, robin.murphy@arm.com
References: <20190408121911.24103-1-eric.auger@redhat.com>
	<20190408121911.24103-5-eric.auger@redhat.com>
	<21bfdab4-846c-1dc7-6dff-62a46cc9c829@arm.com>
	<b4c47851-0269-5aa2-682a-77677f756205@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <9fedefb7-e13c-7ea7-b2ae-50a8f1a7e09b@arm.com>
Date: Wed, 15 May 2019 16:57:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b4c47851-0269-5aa2-682a-77677f756205@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, vincent.stehle@arm.com,
	ashok.raj@intel.com, marc.zyngier@arm.com, christoffer.dall@arm.com
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

On 15/05/2019 14:06, Auger Eric wrote:
> Hi Jean-Philippe,
> 
> On 5/15/19 2:09 PM, Jean-Philippe Brucker wrote:
>> On 08/04/2019 13:18, Eric Auger wrote:
>>> diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
>>> index edcc0dda7993..532a64075f23 100644
>>> --- a/include/uapi/linux/iommu.h
>>> +++ b/include/uapi/linux/iommu.h
>>> @@ -112,4 +112,51 @@ struct iommu_fault {
>>>  		struct iommu_fault_page_request prm;
>>>  	};
>>>  };
>>> +
>>> +/**
>>> + * SMMUv3 Stream Table Entry stage 1 related information
>>> + * The PASID table is referred to as the context descriptor (CD) table.
>>> + *
>>> + * @s1fmt: STE s1fmt (format of the CD table: single CD, linear table
>>> +   or 2-level table)
>>
>> Running "scripts/kernel-doc -v -none" on this header produces some
>> warnings. Not sure if we want to get rid of all of them, but we should
>> at least fix the coding style for this comment (line must start with
>> " * "). I'm fixing it up on my sva/api branch
> Thanks!
> 
> Let me know if you want me to do the job for additional fixes.

I fixed the others warnings as well, in case we ever want to include
this into the kernel doc

Thanks,
Jean

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
