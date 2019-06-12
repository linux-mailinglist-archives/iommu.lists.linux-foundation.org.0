Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C37424DA
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 13:57:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6674E1B3A;
	Wed, 12 Jun 2019 11:57:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 16C231B41
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 11:55:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id BB30279
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 11:55:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E6C128;
	Wed, 12 Jun 2019 04:55:19 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E30603F246;
	Wed, 12 Jun 2019 04:57:00 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] iommu: Add device fault reporting API
To: Joerg Roedel <joro@8bytes.org>
References: <20190603145749.46347-1-jean-philippe.brucker@arm.com>
	<20190612081944.GB17505@8bytes.org>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <0f21e1b2-837f-87ba-6cf3-f6490d9e2a57@arm.com>
Date: Wed, 12 Jun 2019 12:54:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612081944.GB17505@8bytes.org>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "ashok.raj@intel.com" <ashok.raj@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
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

On 12/06/2019 09:19, Joerg Roedel wrote:
> On Mon, Jun 03, 2019 at 03:57:45PM +0100, Jean-Philippe Brucker wrote:
>> Jacob Pan (3):
>>   driver core: Add per device iommu param
>>   iommu: Introduce device fault data
>>   iommu: Introduce device fault report API
>>
>> Jean-Philippe Brucker (1):
>>   iommu: Add recoverable fault reporting
>>
>>  drivers/iommu/iommu.c      | 236 ++++++++++++++++++++++++++++++++++++-
>>  include/linux/device.h     |   3 +
>>  include/linux/iommu.h      |  87 ++++++++++++++
>>  include/uapi/linux/iommu.h | 153 ++++++++++++++++++++++++
>>  4 files changed, 476 insertions(+), 3 deletions(-)
>>  create mode 100644 include/uapi/linux/iommu.h
> 
> Applied, thanks.

Thanks! As discussed I think we need to add padding into the iommu_fault
structure before this reaches mainline, to make the UAPI easier to
extend in the future. It's already possible to extend but requires
introducing a new ABI version number and support two structures. Adding
some padding would only require introducing new flags. If there is no
objection I'll send a one-line patch bumping the structure size to 64
bytes (currently 48)

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
