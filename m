Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2972AFA62
	for <lists.iommu@lfdr.de>; Wed, 11 Nov 2020 22:34:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9CB8986BBB;
	Wed, 11 Nov 2020 21:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHcnVEb32nud; Wed, 11 Nov 2020 21:34:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1735186AF7;
	Wed, 11 Nov 2020 21:34:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03306C016F;
	Wed, 11 Nov 2020 21:34:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3A4AC016F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 21:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C149B875DE
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 21:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8kZ04nOpI8gD for <iommu@lists.linux-foundation.org>;
 Wed, 11 Nov 2020 21:34:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 00EE8875D9
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 21:34:01 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id o20so3889198eds.3
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 13:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vk3KrPrkDYUVNZL3DTlHOE1fBCf+cXVmLxTYq4r55Ss=;
 b=Od+askDr0vG9pmpUQPZuXt8L3vVOI+YG9VdqDwaS5SZlV0Cfyl6laQ4wdhBM7nXLZZ
 U3iGbzOhCX9q1MITnNz9A7A5Q4t05wXykOOo4wVOA/kwB1d9sqlJ6+RoStiLuDM9Qx88
 2mHPPogvFtQMItHlxUUeJMXRc66nQyVh8Swn32wYdFKxuHjr6FaX10tC0n2UhaE5F6XW
 uAyGbZkHnZhEqXNFQXA/8Q8womMmPMAeeejH1vlRPt3ndaVDEgBGbjLDNLQTUO3arM2N
 zlOEMaHnn/XbgA/BZ2fFlahj6wPQUTCE4Bmjvvn3HL4Jjgz0CIrxn5Eth/XqUsQpv7Zf
 8Tpw==
X-Gm-Message-State: AOAM533YNxj1AvE1hIeXaKslCFHiyMcJKgPBfzcq2fNm5qdgz/jwARBB
 nqFrF4cMXxeLSnicIdhZRjk=
X-Google-Smtp-Source: ABdhPJzQP5o5OyQRS7gplBPAqdIpxUsSbwg2yAx1u1p6taNhLhBL8e677pIbq0t1wfjyEtnXAmYO4Q==
X-Received: by 2002:aa7:de95:: with SMTP id j21mr1711074edv.199.1605130440472; 
 Wed, 11 Nov 2020 13:34:00 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id x1sm1437502edl.82.2020.11.11.13.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 13:33:59 -0800 (PST)
Date: Wed, 11 Nov 2020 22:33:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 06/24] iommu/mediatek: Use the common
 mtk-smi-larb-port.h
Message-ID: <20201111213357.GE287176@kozik-lap>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-7-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111123838.15682-7-yong.wu@mediatek.com>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel-team@android.com, anan.sun@mediatek.com,
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

On Wed, Nov 11, 2020 at 08:38:20PM +0800, Yong Wu wrote:
> Use the common larb-port header in the source code.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c  | 7 -------
>  drivers/iommu/mtk_iommu.h  | 1 +
>  drivers/memory/mtk-smi.c   | 1 +
>  include/soc/mediatek/smi.h | 2 --
>  4 files changed, 2 insertions(+), 9 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
