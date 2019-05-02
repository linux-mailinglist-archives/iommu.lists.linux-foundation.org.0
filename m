Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A5117AE
	for <lists.iommu@lfdr.de>; Thu,  2 May 2019 12:55:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C5BE33078;
	Thu,  2 May 2019 10:55:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D277B3047
	for <iommu@lists.linux-foundation.org>;
	Thu,  2 May 2019 10:53:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 8BF7171C
	for <iommu@lists.linux-foundation.org>;
	Thu,  2 May 2019 10:53:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29549A78;
	Thu,  2 May 2019 03:53:56 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E6CF3F719;
	Thu,  2 May 2019 03:53:52 -0700 (PDT)
Subject: Re: [PATCH v7 05/23] iommu: Introduce cache_invalidate API
To: Auger Eric <eric.auger@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>,
	"yi.l.liu@intel.com" <yi.l.liu@intel.com>, Will Deacon
	<Will.Deacon@arm.com>, Robin Murphy <Robin.Murphy@arm.com>
References: <20190408121911.24103-1-eric.auger@redhat.com>
	<20190408121911.24103-6-eric.auger@redhat.com>
	<a9745aef-8686-c761-e3d0-dd0e98a1f5b2@arm.com>
	<e5d2fdd6-4ce1-863e-5198-0b05d727a5b6@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <6af5ddb7-75ad-7d3f-b303-f6f06adb1bf0@arm.com>
Date: Thu, 2 May 2019 11:53:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e5d2fdd6-4ce1-863e-5198-0b05d727a5b6@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	Vincent Stehle <Vincent.Stehle@arm.com>,
	"ashok.raj@intel.com" <ashok.raj@intel.com>,
	Marc Zyngier <Marc.Zyngier@arm.com>,
	Christoffer Dall <Christoffer.Dall@arm.com>
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

On 02/05/2019 07:58, Auger Eric wrote:
> Hi Jean-Philippe,
> 
> On 5/1/19 12:38 PM, Jean-Philippe Brucker wrote:
>> On 08/04/2019 13:18, Eric Auger wrote:
>>> +int iommu_cache_invalidate(struct iommu_domain *domain, struct device *dev,
>>> +			   struct iommu_cache_invalidate_info *inv_info)
>>> +{
>>> +	int ret = 0;
>>> +
>>> +	if (unlikely(!domain->ops->cache_invalidate))
>>> +		return -ENODEV;
>>> +
>>> +	ret = domain->ops->cache_invalidate(domain, dev, inv_info);
>>> +
>>> +	return ret;
>>
>> Nit: you don't really need ret
>>
>> The UAPI looks good to me, so
>>
>> Reviewed-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> Just to make sure, do you accept changes proposed by Jacob in
> https://lkml.org/lkml/2019/4/29/659 ie.
> - the addition of NR_IOMMU_INVAL_GRANU in enum iommu_inv_granularity and
> - the addition of NR_IOMMU_CACHE_TYPE

Ah sorry, I forgot about that, I'll review the next version. Yes they
can be useful (maybe call them IOMMU_INV_GRANU_NR and
IOMMU_CACHE_INV_TYPE_NR?). I guess it's legal to export in UAPI values
that will change over time, as VFIO also does it in its enums.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
