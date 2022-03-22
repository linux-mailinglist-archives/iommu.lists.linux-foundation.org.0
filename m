Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C64E3BF6
	for <lists.iommu@lfdr.de>; Tue, 22 Mar 2022 10:53:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B0E340AA0;
	Tue, 22 Mar 2022 09:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SR8V_yyboXnv; Tue, 22 Mar 2022 09:53:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 39667404FC;
	Tue, 22 Mar 2022 09:53:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 072AEC000B;
	Tue, 22 Mar 2022 09:53:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 378A6C000B
 for <iommu@lists.linux-foundation.org>; Tue, 22 Mar 2022 09:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34CAE60BF3
 for <iommu@lists.linux-foundation.org>; Tue, 22 Mar 2022 09:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fnsVtjhrtug for <iommu@lists.linux-foundation.org>;
 Tue, 22 Mar 2022 09:53:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F43E60BAC
 for <iommu@lists.linux-foundation.org>; Tue, 22 Mar 2022 09:53:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 531B3106F;
 Tue, 22 Mar 2022 02:53:35 -0700 (PDT)
Received: from [10.57.43.230] (unknown [10.57.43.230])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B62283F66F;
 Tue, 22 Mar 2022 02:53:33 -0700 (PDT)
Message-ID: <3e715fb9-7a0d-046a-c32c-bc6afbecf55e@arm.com>
Date: Tue, 22 Mar 2022 09:53:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] iommu: Add capability for pre-boot DMA protection
Content-Language: en-GB
To: Christoph Hellwig <hch@lst.de>
References: <cover.1647624084.git.robin.murphy@arm.com>
 <797c70d255f946c4d631f2ffc67f277cfe0cb97c.1647624084.git.robin.murphy@arm.com>
 <20220322091432.GA27069@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220322091432.GA27069@lst.de>
Cc: michael.jamet@intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, andreas.noever@gmail.com,
 iommu@lists.linux-foundation.org, mario.limonciello@amd.com,
 YehezkelShB@gmail.com, mika.westerberg@linux.intel.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2022-03-22 09:14, Christoph Hellwig wrote:
> On Fri, Mar 18, 2022 at 05:42:57PM +0000, Robin Murphy wrote:
>> VT-d's dmar_platform_optin() actually represents a combination of
>> properties fairly well standardised by Microsoft as "Pre-boot DMA
>> Protection" and "Kernel DMA Protection"[1]. As such, we can provide
>> interested consumers with an abstracted capability rather than
>> driver-specific interfaces that won't scale. We name it for the former
>> aspect since that's what external callers are most likely to be
>> interested in; the latter is for the IOMMU layer to handle itself.
>>
>> Also use this as an opportunity to draw a line in the sand and add a
>> new interface so as not to introduce any more callers of iommu_capable()
>> which I also want to get rid of. For now it's a quick'n'dirty wrapper
>> function, but will evolve to subsume the internal interface in future.
>>
>> [1] https://docs.microsoft.com/en-us/windows-hardware/design/device-experiences/oem-kernel-dma-protection
>>
>> Suggested-by: Christoph Hellwig <hch@lst.de>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> I can't really think of a way in which I suggested this, but it does
> looks like a good interface:

Well, you were the first to say it should be abstracted[1], and since my 
initial thought that it could be hidden completely didn't pan out, I 
felt I should give you credit for being right all along :)

> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks!

Robin.

[1] https://lore.kernel.org/linux-iommu/YjDDUUeZ%2FdvUZoDN@infradead.org/
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
