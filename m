Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C12269004
	for <lists.iommu@lfdr.de>; Mon, 14 Sep 2020 17:34:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A7D9786734;
	Mon, 14 Sep 2020 15:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vWgxAgiY2I9s; Mon, 14 Sep 2020 15:34:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 197C686733;
	Mon, 14 Sep 2020 15:34:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F15F4C0859;
	Mon, 14 Sep 2020 15:34:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 545BDC0859
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 15:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 501758706C
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 15:34:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LjjwWhY7N+co for <iommu@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 15:34:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EEBD587059
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 15:34:06 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id s205so45881lja.7
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6QGIaljRH231VAywJdapvuATziOfA42BJnpSHpoIEVE=;
 b=RSn2RJzblwAHTSK+plrf24n4vXY7/p/jXtG+T94xADRsRUBY8CHEBNgnMf/kQyrnxy
 YieEPQGTw3bOqSmW8AmGOLLdGNA7YSDJLGbEMo+AGcNWh2pxH6XRgNcz8Cs5uCOpKkzC
 gQyRsPyGfUidZAcBfjITy0I3uSNrMpc1xEktaPuU1N5ohOzXYJc8kuUdIFaZ6+PLkH1j
 ej79ZdbMIfsu6iduHBqVwRFdln66PldWiNNCVGGJ8TfEu+jWybTfxA05D2VHpJvxymYA
 bWH+DdU6BYBQ8HP2CiwI9zxdkYMl9jJc8yEPZeyVx3GZKr3H03N+EEitFWK+0KohnbKI
 Gy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6QGIaljRH231VAywJdapvuATziOfA42BJnpSHpoIEVE=;
 b=M4uB8LA5cZfkswkyLGMX3GMRVc3TaWEpCz/WRP1vfIWOS73PgDgJQA72sI7Vkqgzu5
 lJT/0K2+2K5CWYGP63u57LERFYXn9OIlC3PQoaB9GaorQUY+xcSk39BNvvuOcHmZpMYI
 P93hqnznoDCKkEUu0ymyxQfRpopcHFMHJzryre5gNtjcUEbGQtaMc+40d4w16HShGQ2g
 1RQfaZH102sMClDBSIoqZWSyn9rOrpdYe8rvy16pKtTp8RRpJsTN9oNe1AZWUarhlaf1
 ywTBKlkXTcygsveLVgxc12zb2dMUbUxjdRUAO5+SSSv3LCZSjSKirLU09MCR7OZoXMJw
 HJoA==
X-Gm-Message-State: AOAM531Jm/n967/ufC3nDdoiYqyhrGUHPteUyRHQE00sQYtJ+cwF1frU
 qTxWfZ25q9H06ZxU0z2MBIs=
X-Google-Smtp-Source: ABdhPJwhd/LhTRq+JWSW5bzIk6PAoYzRDD2WFOZyHy/0zgbs8GXUoAwbOWmbxU7cQ/01j9Vl+1ORow==
X-Received: by 2002:a05:651c:200b:: with SMTP id
 s11mr5091489ljo.196.1600097644849; 
 Mon, 14 Sep 2020 08:34:04 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:44ca:acb2:3cb7:6882:b0eb:1108])
 by smtp.gmail.com with ESMTPSA id
 l129sm3367001lfd.191.2020.09.14.08.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 08:34:04 -0700 (PDT)
Subject: Re: [PATCH 03/17] drm/exynos: stop setting DMA_ATTR_NON_CONSISTENT
To: Christoph Hellwig <hch@lst.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa
 <tfiga@chromium.org>, Matt Porter <mporter@kernel.crashing.org>,
 iommu@lists.linux-foundation.org
References: <20200914144433.1622958-1-hch@lst.de>
 <20200914144433.1622958-4-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <7a1d11c2-0fc5-e110-dabe-960e516bb343@gmail.com>
Date: Mon, 14 Sep 2020 18:34:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200914144433.1622958-4-hch@lst.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 9/14/20 5:44 PM, Christoph Hellwig wrote:

> DMA_ATTR_NON_CONSISTENT is a no-op except on PARISC and some mips
> configs, so don't set it in this ARM specific driver.

   Hm, PARICS and ARM capitalized but mips in lower case? :-)

> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
