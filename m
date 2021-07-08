Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C953BF7C6
	for <lists.iommu@lfdr.de>; Thu,  8 Jul 2021 11:47:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFBB383AF9;
	Thu,  8 Jul 2021 09:47:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfJcqAWAvZjt; Thu,  8 Jul 2021 09:47:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 100E383AF4;
	Thu,  8 Jul 2021 09:47:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3A98C001F;
	Thu,  8 Jul 2021 09:47:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 954AAC000E
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 09:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F04740217
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 09:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9X27f0dztqW9 for <iommu@lists.linux-foundation.org>;
 Thu,  8 Jul 2021 09:47:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8CE8400E0
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 09:47:18 +0000 (UTC)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1m1Qcm-0007PF-E1
 for iommu@lists.linux-foundation.org; Thu, 08 Jul 2021 09:47:16 +0000
Received: by mail-wm1-f71.google.com with SMTP id
 m7-20020a05600c4f47b02901ff81a3bb59so951513wmq.2
 for <iommu@lists.linux-foundation.org>; Thu, 08 Jul 2021 02:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sqWyNGudVuElSm2fjSw0fUVrxrGpZuSoG0yfc9ufVeY=;
 b=iUM1VKzDHVVfYBVu5aTq0DukSs7YD+zlKqJPZK876cn51fwIGrX1bUESI19fLe9D0a
 ztDxvzSafrUdyWtklVo9ICauugZRGrLfWmOZ/RVtDP+cFmY3s/4+1T+jv+EWkptC9ypH
 HHF3pQiRb+bvOO23fBblyXOrYuxlExPp8GRAsPnpEpP/nuWNqN08YujsNSivTPgHmmLZ
 6uZqKQPWwUtGzmwyN9Y9iyjTFW4g70oIT0GOaHzMLp2BcjRW27T1XPWV0iRQHmLnU5bj
 gTBJmh+HDEbKIrkDAG5lTbHb1gK1NN3XlHUejAD451h6d5uXtVZuxtxA9XWKho1+5kBl
 xx0A==
X-Gm-Message-State: AOAM532L73VNC6HhM0x0U8TbCJH/Tfh0jtoBU7HU6LL0Bc9bvczO9VDq
 HfNx7vB47c8TO/a/yT9j6wFT6cPnism+x+4SFRjYYETK+rfVk0A7ZgKx1CCg1mERMLvI7aTGY1H
 +b+eUmRotJ/1w23/5Emke6yg03Xor3C1hhT29XLGfGxYOGNQ=
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr33862444wri.348.1625737636226; 
 Thu, 08 Jul 2021 02:47:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA3YilHPZ1h4YN/boLpRhydKgVWfFWvPY1mi0CfKNUCFbOLg+vcpMYWAsmGhdef7F2n7aCtg==
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr33862416wri.348.1625737636070; 
 Thu, 08 Jul 2021 02:47:16 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id d24sm8936115wmb.42.2021.07.08.02.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 02:47:15 -0700 (PDT)
Subject: Re: [PATCH 6/9] memory: mtk-smi: Add smi sub common support
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20210616114346.18812-1-yong.wu@mediatek.com>
 <20210616114346.18812-7-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f5df9d97-b883-2786-dd9c-d4980e1d70d1@canonical.com>
Date: Thu, 8 Jul 2021 11:47:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616114346.18812-7-yong.wu@mediatek.com>
Content-Language: en-US
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com, srv_heupstream@mediatek.com,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, anthony.huang@mediatek.com,
 ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On 16/06/2021 13:43, Yong Wu wrote:
> This patch adds smi-sub-common support. some larbs may connect with the
> smi-sub-common, then connect with smi-common.

Please start sentences with capital letter. This (similarly to "This
patch") appears in multiple patches.

> 
> Before we create device link between smi-larb with smi-common, If we have
> sub-common, we should use device link the smi-larb and smi-sub-common,
> then use device link between the smi-sub-common with smi-common. This is
> for enabling clock/power automatically.
> Move the device link code to a new interface for reusing.
> 
> there is no SW extra setting for smi-sub-common.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 78 ++++++++++++++++++++++++++--------------
>  1 file changed, 52 insertions(+), 26 deletions(-)
> 


Best regards,
Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
