Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 961EB4C0F75
	for <lists.iommu@lfdr.de>; Wed, 23 Feb 2022 10:44:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F2DE40605;
	Wed, 23 Feb 2022 09:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s730gHQG9zop; Wed, 23 Feb 2022 09:44:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 21EFE40602;
	Wed, 23 Feb 2022 09:44:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2C55C0073;
	Wed, 23 Feb 2022 09:44:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 925C6C0011
 for <iommu@lists.linux-foundation.org>; Wed, 23 Feb 2022 09:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 728D88136B
 for <iommu@lists.linux-foundation.org>; Wed, 23 Feb 2022 09:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kapsi.fi
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mmy2PPpIi8FZ for <iommu@lists.linux-foundation.org>;
 Wed, 23 Feb 2022 09:44:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3447381362
 for <iommu@lists.linux-foundation.org>; Wed, 23 Feb 2022 09:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uD+YdSB7BK2YZwHIlrFrUTb1ozQHZ1Cv2M2UMS1FjFg=; b=ddUFMN63QJ6TBX1ryUpKDsU/sP
 +7bMajKfZDclWj9HZR+nZqarXuhOYEc6+hQbWxMk1nIPbkJT3HthlJ+E3J7gP+aY9mkI12PxJTwVz
 j5o4v0FG6u/gMKV4m/QztKGHnt4kpcUZrULZUio4pv6LvX8W9HuQ+EaSsI9UA1MTfYL2wRR0+siSb
 8+VsToOmQMrcizomZAYvuvXA1fqbsA30K5w1Xbfa/4JFtCLIOP4S5Sxd+MR15CRsWy1QPPk6NaoIz
 OXPOpzYJ93NSv7xV6y6zIGnswVRXmhe45W0UBnXxJV4IBbSb9j4ZVAbXKcNb7/9F5yjdZDB2l8pd9
 Aid3wUXg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nMoBn-0003QL-UA; Wed, 23 Feb 2022 11:44:03 +0200
Message-ID: <d2579e10-e5c2-0d99-4233-19318a1db6c1@kapsi.fi>
Date: Wed, 23 Feb 2022 11:44:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 3/9] gpu: host1x: Add context device management code
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-4-mperttunen@nvidia.com>
 <YhUOKaoCA7dyAZAh@infradead.org>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <YhUOKaoCA7dyAZAh@infradead.org>
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: devicetree@vger.kernel.org, will@kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jonathanh@nvidia.com, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
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

On 2/22/22 18:24, Christoph Hellwig wrote:
> On Fri, Feb 18, 2022 at 01:39:46PM +0200, Mikko Perttunen wrote:
>> +
>> +/*
>> + * Due to an issue with T194 NVENC, only 38 bits can be used.
>> + * Anyway, 256GiB of IOVA ought to be enough for anyone.
>> + */
>> +static dma_addr_t context_device_dma_mask = DMA_BIT_MASK(38);
> 
> You need a mask per device.  Please don't share the same variable
> for multiple masks.
> 
>> +EXPORT_SYMBOL(host1x_context_alloc);
> 
> All this low-level code really should be EXPORT_SYMBOL_GPL.

Thanks, will fix (and same for patch 2).

Mikko
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
