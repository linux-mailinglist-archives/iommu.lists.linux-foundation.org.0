Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0B81FD8FE
	for <lists.iommu@lfdr.de>; Thu, 18 Jun 2020 00:38:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BB59F2038F;
	Wed, 17 Jun 2020 22:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NA2ew+DVlEF5; Wed, 17 Jun 2020 22:38:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 04B8C20382;
	Wed, 17 Jun 2020 22:38:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8F07C016E;
	Wed, 17 Jun 2020 22:38:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFEE4C016E
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 22:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9460D20382
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 22:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6uM0FamscXW8 for <iommu@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 22:38:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 0149920370
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 22:38:01 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id i25so4923072iog.0
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 15:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ksvsgsjdaZcMUEmgk684MCGB6ZGZGrqLwnOCtcep1MA=;
 b=F1X378Jd7UnCIGviu+EPtvBLNkak8BZSV8sYkMk02niUc85sFzblIIxPQxEKnDr2E0
 LuwYQsn8h+njgYmDeM0KfmT74bNuql6jcmdBsb1sXgW3N4F2/UMQqwTMiaUF+YGp7sYT
 9aYtucI5e+RNvLBtILHQ4YUi7RSTHsVpANHVxv/9tSfVZAPm15hBQFrRMC98de+8kWBk
 HJ8S++E0U76NA1Ooi3Tx2H9ULUXAaArKWN7S40B6cA54Cd6+IukDmjcEwZWW75ZX2dz4
 xeB0MoYbrNwsRU4QW5jZt2OS6js7wQo4Mn1OoR4j7AbarPHDXPPRfWLQfQLFEy9xgNm5
 othw==
X-Gm-Message-State: AOAM532Z8g7ptY7CaLP/zE8G+DD0fY61KypzSisk8j5i8rVLl3/+wnkS
 w3RSkEPtdkkCa/S15co3PA==
X-Google-Smtp-Source: ABdhPJyFzeWwL7OayI26A4GqFjHOYTLMKOxLa56FuTpcSoIToqXI02vzGs7qF3hOCwGOKyHLOvEOzw==
X-Received: by 2002:a5e:a705:: with SMTP id b5mr1873841iod.12.1592433481280;
 Wed, 17 Jun 2020 15:38:01 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b13sm521573ilq.20.2020.06.17.15.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:38:00 -0700 (PDT)
Received: (nullmailer pid 2965977 invoked by uid 1000);
 Wed, 17 Jun 2020 22:38:00 -0000
Date: Wed, 17 Jun 2020 16:38:00 -0600
From: Rob Herring <robh@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: iommu: renesas, ipmmu-vmsa: add r8a77961
 support
Message-ID: <20200617223800.GA2965923@bogus>
References: <1591873830-10128-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1591873830-10128-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591873830-10128-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, iommu@lists.linux-foundation.org
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

On Thu, 11 Jun 2020 20:10:29 +0900, Yoshihiro Shimoda wrote:
> Add support for r8a77961 (R-Car M3-W+).
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
