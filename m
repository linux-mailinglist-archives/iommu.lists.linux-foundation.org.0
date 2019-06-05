Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE6335B40
	for <lists.iommu@lfdr.de>; Wed,  5 Jun 2019 13:26:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2DDE6BB3;
	Wed,  5 Jun 2019 11:26:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D1EDCB8E
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 11:26:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 6C2AB19B
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 11:26:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BE41374;
	Wed,  5 Jun 2019 04:26:38 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D9553F5AF;
	Wed,  5 Jun 2019 04:26:36 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH v2 0/4] iommu: Add device fault reporting API
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <20190603145749.46347-1-jean-philippe.brucker@arm.com>
	<20190603145951.729600e6@jacob-builder>
Message-ID: <3d3bc50f-beb3-dda8-dfaa-ecb4dcffd560@arm.com>
Date: Wed, 5 Jun 2019 12:26:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190603145951.729600e6@jacob-builder>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "ashok.raj@intel.com" <ashok.raj@intel.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Robin Murphy <Robin.Murphy@arm.com>
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

On 03/06/2019 22:59, Jacob Pan wrote:
> On Mon,  3 Jun 2019 15:57:45 +0100
> Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:
> 
>> Allow device drivers and VFIO to get notified on IOMMU translation
>> fault, and handle recoverable faults (PCI PRI). Several series require
>> this API (Intel VT-d and Arm SMMUv3 nested support, as well as the
>> generic host SVA implementation).
>>
>> Changes since v1 [1]:
>> * Allocate iommu_param earlier, in iommu_probe_device().
>> * Pass struct iommu_fault to fault handlers, instead of the
>>   iommu_fault_event wrapper.
>> * Removed unused iommu_fault_event::iommu_private.
>> * Removed unnecessary iommu_page_response::addr.
>> * Added iommu_page_response::version, which would allow to introduce a
>>   new incompatible iommu_page_response structure (as opposed to just
>>   adding a flag + field).
>>
>> [1] [PATCH 0/4] iommu: Add device fault reporting API
>>     https://lore.kernel.org/lkml/20190523180613.55049-1-jean-philippe.brucker@arm.com/
>>
>> Jacob Pan (3):
>>   driver core: Add per device iommu param
>>   iommu: Introduce device fault data
>>   iommu: Introduce device fault report API
>>
>> Jean-Philippe Brucker (1):
>>   iommu: Add recoverable fault reporting
>>
> This interface meet the need for vt-d, just one more comment on 2/4. Do
> you want to add Co-developed-by you for the three patches from me?

I'm fine without it, I don't think it adds much to the Signed-off-by,
which is required

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
