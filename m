Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241435A00C
	for <lists.iommu@lfdr.de>; Fri,  9 Apr 2021 15:40:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28EB6607E6;
	Fri,  9 Apr 2021 13:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9b7tS1uOJuW; Fri,  9 Apr 2021 13:40:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FA0F60759;
	Fri,  9 Apr 2021 13:40:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5824C000A;
	Fri,  9 Apr 2021 13:40:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EA17C000A
 for <iommu@lists.linux-foundation.org>; Fri,  9 Apr 2021 13:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CAB9848A9
 for <iommu@lists.linux-foundation.org>; Fri,  9 Apr 2021 13:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Sktd4uoryQk for <iommu@lists.linux-foundation.org>;
 Fri,  9 Apr 2021 13:40:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBFF3848CD
 for <iommu@lists.linux-foundation.org>; Fri,  9 Apr 2021 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617975604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lsrzJwlfstULCCREnSPVP3WRVuSyvEw5HXvTFd2r4do=;
 b=izwCXYbj7LPplZxXeEDlBQpJHGBDRA/kDwEZApAvppvavi4LsWzRqHWS1FW67iz2oh/QWo
 SwGTXDhFWwpuQPSb6zBOU/LYMio8WRpY+j0EJfJFVrT0irnjXFNT3ZdFVj5YrD+sQ+foZS
 Qa4jDljdKqkS7a5yDVr5HJwJV0RiP4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-3MzYaf2pNUSmKJKsGUehFg-1; Fri, 09 Apr 2021 09:40:02 -0400
X-MC-Unique: 3MzYaf2pNUSmKJKsGUehFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB324C73AD;
 Fri,  9 Apr 2021 13:39:57 +0000 (UTC)
Received: from [10.36.115.11] (ovpn-115-11.ams2.redhat.com [10.36.115.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E60C619801;
 Fri,  9 Apr 2021 13:39:48 +0000 (UTC)
Subject: Re: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
To: Arnd Bergmann <arnd@arndb.de>
References: <20210409112035.27221-1-david@redhat.com>
 <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <53ec94ac-ffe3-d0bc-d081-3489fa03daa1@redhat.com>
Date: Fri, 9 Apr 2021 15:39:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Eric Anholt <eric@anholt.net>,
 Christoph Hellwig <hch@lst.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Joel Stanley <joel@jms.id.au>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Linux-MM <linux-mm@kvack.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Mike Rapoport <rppt@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
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

On 09.04.21 15:35, Arnd Bergmann wrote:
> On Fri, Apr 9, 2021 at 1:21 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> Random drivers should not override a user configuration of core knobs
>> (e.g., CONFIG_DMA_CMA=n). Applicable drivers would like to use DMA_CMA,
>> which depends on CMA, if possible; however, these drivers also have to
>> tolerate if DMA_CMA is not available/functioning, for example, if no CMA
>> area for DMA_CMA use has been setup via "cma=X". In the worst case, the
>> driver cannot do it's job properly in some configurations.
>>
>> For example, commit 63f5677544b3 ("drm/etnaviv: select CMA and DMA_CMA if
>> available") documents
>>          While this is no build dependency, etnaviv will only work correctly
>>          on most systems if CMA and DMA_CMA are enabled. Select both options
>>          if available to avoid users ending up with a non-working GPU due to
>>          a lacking kernel config.
>> So etnaviv really wants to have DMA_CMA, however, can deal with some cases
>> where it is not available.
>>
>> Let's introduce WANT_DMA_CMA and use it in most cases where drivers
>> select CMA/DMA_CMA, or depend on DMA_CMA (in a wrong way via CMA because
>> of recursive dependency issues).
>>
>> We'll assume that any driver that selects DRM_GEM_CMA_HELPER or
>> DRM_KMS_CMA_HELPER would like to use DMA_CMA if possible.
>>
>> With this change, distributions can disable CONFIG_CMA or
>> CONFIG_DMA_CMA, without it silently getting enabled again by random
>> drivers. Also, we'll now automatically try to enabled both, CONFIG_CMA
>> and CONFIG_DMA_CMA if they are unspecified and any driver is around that
>> selects WANT_DMA_CMA -- also implicitly via DRM_GEM_CMA_HELPER or
>> DRM_KMS_CMA_HELPER.
>>
>> For example, if any driver selects WANT_DMA_CMA and we do a
>> "make olddefconfig":
>>
>> 1. With "# CONFIG_CMA is not set" and no specification of
>>     "CONFIG_DMA_CMA"
>>
>> -> CONFIG_DMA_CMA won't be part of .config
>>
>> 2. With no specification of CONFIG_CMA or CONFIG_DMA_CMA
>>
>> Contiguous Memory Allocator (CMA) [Y/n/?] (NEW)
>> DMA Contiguous Memory Allocator (DMA_CMA) [Y/n/?] (NEW)
>>
>> 3. With "# CONFIG_CMA is not set" and "# CONFIG_DMA_CMA is not set"
>>
>> -> CONFIG_DMA_CMA will be removed from .config
>>
>> Note: drivers/remoteproc seems to be special; commit c51e882cd711
>> ("remoteproc/davinci: Update Kconfig to depend on DMA_CMA") explains that
>> there is a real dependency to DMA_CMA for it to work; leave that dependency
>> in place and don't convert it to a soft dependency.
> 
> I don't think this dependency is fundamentally different from the others,
> though davinci machines tend to have less memory than a lot of the
> other machines, so it's more likely to fail without CMA.
> 

I was also unsure - and Lucas had similar thoughts. If you want, I can 
send a v4 also taking care of this.

Thanks!

> Regardless of this,
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 


-- 
Thanks,

David / dhildenb

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
