Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F746BD00
	for <lists.iommu@lfdr.de>; Wed, 17 Jul 2019 15:28:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 78887EF2;
	Wed, 17 Jul 2019 13:28:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EAE08EE5
	for <iommu@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 13:21:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 98C4371C
	for <iommu@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 13:21:25 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HDL8qN053169;
	Wed, 17 Jul 2019 08:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563369668;
	bh=OxgZ7MOvt4xRiKGYYeG81gjj0/OIKQv6y5JnxuhZoFs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=WOeN+a/NksI2gXRM1SIQMWBRCbkHU4+xz6sNcwoGcsflztrZ8fWvud/ITcx8IMtBZ
	Jqe2MuuqMbWwsADPB7hpQx93ITyiEVQLzAF66bT7TU+2wm8E65D8sYkDzD1OSOLIYM
	iHR73DUXVai/YXFmwNCnUO5tTqu0O2j+IODDAZiw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HDL8PI058396
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jul 2019 08:21:08 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 17 Jul 2019 08:21:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 17 Jul 2019 08:21:07 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HDL4cF000406;
	Wed, 17 Jul 2019 08:21:05 -0500
Subject: Re: add swiotlb support to arm32
To: Christoph Hellwig <hch@lst.de>, Russell King - ARM Linux admin
	<linux@armlinux.org.uk>
References: <20190709142011.24984-1-hch@lst.de>
Message-ID: <6a56eacd-d481-de93-e0d8-64d8385de214@ti.com>
Date: Wed, 17 Jul 2019 18:51:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709142011.24984-1-hch@lst.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 17 Jul 2019 13:28:08 +0000
Cc: iommu@lists.linux-foundation.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Roger Quadros <rogerq@ti.com>
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
From: Vignesh Raghavendra via iommu <iommu@lists.linux-foundation.org>
Reply-To: Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 09/07/19 7:50 PM, Christoph Hellwig wrote:
> Hi Russell,
> 
> This series adds swiotlb support to the 32-bit arm port to ensure
> platforms with LPAE support can support DMA mapping for all devices
> using 32-bit dma masks, just like we do on other ports that support
>> 32-bit physical addressing and don't have an iommu.


This series fixes SATA errors seen on TI platforms with LPAE like DRA7
Rev H EVM.

Tested-by: Vignesh Raghavendra <vigneshr@ti.com>

Thanks for the fix!

-- 
Regards
Vignesh
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
