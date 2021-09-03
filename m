Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A58400625
	for <lists.iommu@lfdr.de>; Fri,  3 Sep 2021 21:51:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C3CB60676;
	Fri,  3 Sep 2021 19:51:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQyuisR_gxTE; Fri,  3 Sep 2021 19:50:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9C1A06070C;
	Fri,  3 Sep 2021 19:50:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B7DFC0022;
	Fri,  3 Sep 2021 19:50:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B7BBC000E
 for <iommu@lists.linux-foundation.org>; Fri,  3 Sep 2021 19:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AB45426A6
 for <iommu@lists.linux-foundation.org>; Fri,  3 Sep 2021 19:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JIQ_6iMaor4W for <iommu@lists.linux-foundation.org>;
 Fri,  3 Sep 2021 19:50:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33F7042559
 for <iommu@lists.linux-foundation.org>; Fri,  3 Sep 2021 19:50:55 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 y16-20020a4ad6500000b0290258a7ff4058so17503oos.10
 for <iommu@lists.linux-foundation.org>; Fri, 03 Sep 2021 12:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EBFLmekutrmRxU3ByHJT7leszJzUX4EBGLPcs8sBao8=;
 b=q9VJa7UQ6TH5wdseuEyJTq44xnRn5UpLBjudXfUUnHxXG+15UCS8h0ASQbsHlt6PTz
 Vc+Zc/LxzKx0PJgShuUrmXm5Hrcqyo9GkJ8JgQk42aWn6wUjvMQfGMvnqslhxBZ1NhLi
 3gGGb6RyCBSEIHWSz5TOTAQgyh+oXnrtl9m1xblnkMG+tDHeDtR7XiKUAN29c3zRUIyW
 CrrE60wGSXfob9YWa0Xk7BStoyGhRKDQExnvPfkvYkLZK/BvMqQkGJ52uAxm0VVt5oP/
 Y5/839pNcij7vXcgFaI3TMR1QGje2smqEdWyBV0zYpoPBvi/foWoQOWoP8Z1KzLpTqIK
 mtKg==
X-Gm-Message-State: AOAM5334Vkt/tpG6GljUV4OYXW8PlSb4AIKuw5oPXQzDrSuUVJ65Vt23
 dehSc0U6KzXJDAQo5o51HA==
X-Google-Smtp-Source: ABdhPJzQwSlUjPmt9nmt4wfcz2TqN3ODYwvOntLljzI2RULMGR+QOqgoSya/tElc/6kDUno7UeFpAg==
X-Received: by 2002:a4a:a78a:: with SMTP id l10mr4374964oom.30.1630698654248; 
 Fri, 03 Sep 2021 12:50:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i1sm71822oiy.25.2021.09.03.12.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 12:50:53 -0700 (PDT)
Received: (nullmailer pid 3347203 invoked by uid 1000);
 Fri, 03 Sep 2021 19:50:52 -0000
Date: Fri, 3 Sep 2021 14:50:52 -0500
From: Rob Herring <robh@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: iommu: renesas, ipmmu-vmsa: add r8a779a0
 support
Message-ID: <YTJ8nCgrnZ6bcz01@robh.at.kernel.org>
References: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com>
 <20210901102705.556093-2-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210901102705.556093-2-yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, will@kernel.org
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

On Wed, 01 Sep 2021 19:27:04 +0900, Yoshihiro Shimoda wrote:
> Add support for r8a779a0 (R-Car V3U).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
