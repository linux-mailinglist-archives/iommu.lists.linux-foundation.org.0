Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E2E7A6EA
	for <lists.iommu@lfdr.de>; Tue, 30 Jul 2019 13:28:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 78BD42C0D;
	Tue, 30 Jul 2019 11:28:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AE6712BFD
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 11:24:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 42654D3
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 11:24:05 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6UBNwSL086590;
	Tue, 30 Jul 2019 06:23:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564485838;
	bh=bePICY9kNLcLOXhYrJoI3GRMfK4jeDEPCdEecBOuYVk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=UbPMT9XRI32A7NfJlQJkwhI/3bf2x6G4IPZOIFWxzr7e2OAOsKEdh2AWsPGcNXTT2
	OKCD8225QykWeITsIkSCv+cqVx3N6I7UhfGXxaGI/w0Oy3nhMD1DPsujkuwphwrwb5
	mvQhBzvAY4UFSqy/rv8nhvCq0svgUNYCaFmV4wlY=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6UBNwmZ057992
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Jul 2019 06:23:58 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 30 Jul 2019 06:23:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 30 Jul 2019 06:23:58 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6UBNuKk043545;
	Tue, 30 Jul 2019 06:23:57 -0500
Subject: Re: [PATCH] dma-mapping: remove dma_{alloc,free,mmap}_writecombine
To: Christoph Hellwig <hch@lst.de>
References: <20190730061849.29686-1-hch@lst.de>
	<5f73f400-eff2-6c7b-887d-c768642d8df1@ti.com>
	<20190730102050.GA1663@lst.de>
Message-ID: <f8425921-dc50-0cbd-72cb-b73a1194cfb7@ti.com>
Date: Tue, 30 Jul 2019 14:23:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730102050.GA1663@lst.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, laurent.pinchart@ideasonboard.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
From: Tomi Valkeinen via iommu <iommu@lists.linux-foundation.org>
Reply-To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 30/07/2019 13:20, Christoph Hellwig wrote:
> On Tue, Jul 30, 2019 at 10:50:32AM +0300, Tomi Valkeinen wrote:
>> On 30/07/2019 09:18, Christoph Hellwig wrote:
>>> We can already use DMA_ATTR_WRITE_COMBINE or the _wc prefixed version,
>>> so remove the third way of doing things.
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>> ---
>>>    drivers/gpu/drm/omapdrm/dss/dispc.c | 11 +++++------
>>>    include/linux/dma-mapping.h         |  9 ---------
>>>    2 files changed, 5 insertions(+), 15 deletions(-)
>>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>
>> Which tree should this be applied to?
> 
> I'd like to add it to the dma-mapping tree if possible.

That's ok for me.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
