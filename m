Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DF22D41D0
	for <lists.iommu@lfdr.de>; Wed,  9 Dec 2020 13:12:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 24C4C86FD9;
	Wed,  9 Dec 2020 12:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIBuWT5aGamS; Wed,  9 Dec 2020 12:12:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1226186CDB;
	Wed,  9 Dec 2020 12:12:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B3ECC013B;
	Wed,  9 Dec 2020 12:12:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A16C0C013B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 12:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 743E3273FC
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 12:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KCRVYQJAoY75 for <iommu@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 12:12:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 481B420778
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 12:12:22 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r7so1485408wrc.5
 for <iommu@lists.linux-foundation.org>; Wed, 09 Dec 2020 04:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YzNq/OrRULxzTzwcpqVhoNHAyvtCdZCJ/sWJN5KPKoY=;
 b=H+/nT7ExyNPq2Bpkv9edk8anqKSEPEzltPgc5tZoGga6xRlhRUKzbt1PEEoyDp54Xa
 OuyYdcYn3a53Mty09njJW2e1zdRFxxhfnarZofTH/SEB8aXJ0FbA2pttFFb6Pt8SC62d
 QNj0OH60jg6vDf026sIar4JW/wP2gGGLxHISxLtR14+Gu+DGL+98WGVGcg0Y+2wFrveD
 0kCkRn7XLnzFEDhldhNiM/9FKFuWisRyHVjRPMD2ZdUIQmrcaEy+TXR1jehFvKIqYDFJ
 Y4bm6OqzB9ltOsOjFM986uN1RrMsOOuhrvKq06i0MKfx4c8vGl2dPsjemeRuE29kd/3N
 LcbQ==
X-Gm-Message-State: AOAM533eXO+6+PPeHAcmSJQvPlebQpZnams0xK0lTNO60T2kOcpDm3ik
 P8M451EoqesU+VW+Ptgjz3E=
X-Google-Smtp-Source: ABdhPJyzVn9lT40VQ7tMQlRCoD8HI7BETLODhLoHSG3uMDmE6uPI+MIyct0aSvhiEK8h7LXVs1QvpQ==
X-Received: by 2002:adf:eac7:: with SMTP id o7mr2414611wrn.23.1607515940605;
 Wed, 09 Dec 2020 04:12:20 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id 90sm3087627wrl.60.2020.12.09.04.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 04:12:18 -0800 (PST)
Date: Wed, 9 Dec 2020 13:12:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 05/27] dt-bindings: memory: mediatek: Rename header
 guard for SMI header file
Message-ID: <20201209121217.GA25951@kozik-lap>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-6-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209080102.26626-6-yong.wu@mediatek.com>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
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

On Wed, Dec 09, 2020 at 04:00:40PM +0800, Yong Wu wrote:
> Only rename the header guard for all the SoC larb port header file.
> No funtional change.
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
