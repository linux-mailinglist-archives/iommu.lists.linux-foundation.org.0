Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BD895227550
	for <lists.iommu@lfdr.de>; Tue, 21 Jul 2020 04:02:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 75AB3864B3;
	Tue, 21 Jul 2020 02:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aEqp3wR_W0Ig; Tue, 21 Jul 2020 02:02:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 110A7864A6;
	Tue, 21 Jul 2020 02:02:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9966C016F;
	Tue, 21 Jul 2020 02:02:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F374C016F
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 02:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F281684AAE
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 02:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7NqAwQ2vH7e for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 02:02:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 51875864A6
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 02:02:53 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id v8so19755094iox.2
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 19:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ler81PLDj8c/ETj2nxI+bIOhjpg0lok1Sis4qfEHFDg=;
 b=h/NKK2H3SyBpzsD25IgdgS6NhRSCqb/H6PmXDWdh8fqvKH9+HiN9wcMyiQLQCgBqvU
 9CQeFYXD2LNDVnv0/aG6P6M6yrl/IqBKai48Qz4U++qJkNjfGAy8nCxfXVQjcUiK61Q5
 o+Rw+TD4HKvqVDVuOvbkqC4jBChF4oVlupZe3gEYt2x5LvgyKFJr78pFyVnLgv8Hrrij
 2hlWKxvTQ4xwpaWy452ISNMNqGEDcqZuS3JHAm6UzR7OD2ad4jvYwCXHORwC15Pndzrg
 F/EIMaoNpIJ6tFkuN6iQsHZXiBC29kMkW9cy6qMnEPdAhOgCzO5BhFnw8puCa93JX83B
 IROg==
X-Gm-Message-State: AOAM531TVCCmcvBZlu5LUICMofNmDUIDQpipDwjeKXy5aX9ABtB3nRuM
 X1vldMYUElr4IFS8bvRcIg==
X-Google-Smtp-Source: ABdhPJwZCe2h4AviiyvIFBGlgC05v7ot4+I1iDQiZQydaBNoQO+wiOKKAdBuVl53L7vk3LV4pAgx3A==
X-Received: by 2002:a05:6602:2fd5:: with SMTP id
 v21mr25481598iow.41.1595296972677; 
 Mon, 20 Jul 2020 19:02:52 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id w7sm7795817iov.1.2020.07.20.19.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 19:02:52 -0700 (PDT)
Received: (nullmailer pid 3375633 invoked by uid 1000);
 Tue, 21 Jul 2020 02:02:50 -0000
Date: Mon, 20 Jul 2020 20:02:50 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 6/9] dt-bindings: gpio: renesas,rcar-gpio: Add r8a774e1
 support
Message-ID: <20200721020250.GA3375580@bogus>
References: <1594676120-5862-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594676120-5862-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594676120-5862-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-renesas-soc@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Prabhakar <prabhakar.csengg@gmail.com>, linux-gpio@vger.kernel.org,
 dmaengine@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Mon, 13 Jul 2020 22:35:17 +0100, Lad Prabhakar wrote:
> Document Renesas RZ/G2H (R8A774E1) GPIO blocks compatibility within the
> relevant dt-bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
