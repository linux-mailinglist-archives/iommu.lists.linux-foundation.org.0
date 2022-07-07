Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3851956A695
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 17:06:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEC2F61226;
	Thu,  7 Jul 2022 15:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEC2F61226
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=SY18HDXH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCZOnbeik1Eq; Thu,  7 Jul 2022 15:06:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D113661225;
	Thu,  7 Jul 2022 15:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D113661225
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 874C1C007D;
	Thu,  7 Jul 2022 15:06:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1306C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 14:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A64F61225
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 14:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A64F61225
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mKcX1kNl5Him for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 14:29:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7A9B61219
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7A9B61219
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 14:29:19 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id g14so22912273qto.9
 for <iommu@lists.linux-foundation.org>; Thu, 07 Jul 2022 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=BUX3WMFYAEnPL/c65L33A7PAl0MmI35FiK9zEtWBc4k=;
 b=SY18HDXHaoYBAw5YtvF95ZHHOllk2uHUknYmRZwcZLZweTgEV/dKeKRSOCRcmd4HnS
 pHW6leOwEOCyNx2yHNtgIyT0ZthAOHVpBTH61YvXnq/d+AM5QjEyTqthDK0WyoUjKbsz
 iJO9JMfhT6YvzNjJH+eLAwMgQelXCQ8UjCkgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=BUX3WMFYAEnPL/c65L33A7PAl0MmI35FiK9zEtWBc4k=;
 b=DG/lgfT6DtOo9cEuKEGokkpU8wIk08gw5QDQFYBhtCKOKYNNA7NFYeUOX3W336HRGX
 DFMce6JYVADDFzA3Q3twpCIqA35b/1AwhQoHEtpPwiYl2p326AOYAPlEY9xSR8HvYdhk
 9vEFV+8X6It+9mowtVqdkpcWfdImcx25d0K1klVBnkvFsGPPGG++EZ5SAcEjM4VbG+9b
 njTkaGg6LVaFE3h1rh2MBfCZhnTOm3okG5FskMthB5+DadCWlddRT2qlJGFY/cjGSMOB
 yjfWbBB1Nqw/HLaf1mGIr+ZOvPKBgAS/ceIA4jhFUFeBKyMKz+jfvBmukR60WDaCdnub
 LuMg==
X-Gm-Message-State: AJIora+36elkvO+snWqIyk6+9lbwJPPY2HdKcFbfHx3AN/B+nn/I4KFd
 Gpmlsfcr07yc4nTv17CoJtMQzm6NMHAl6i14
X-Google-Smtp-Source: AGRyM1vOwPcspw97/TQ6cKFUtIYLYVvLQ+77x205joyZwYzNuH+AypoB3LV+O6e+X5mnet5ZZzpeQQ==
X-Received: by 2002:ac8:7f46:0:b0:31e:9dba:acf3 with SMTP id
 g6-20020ac87f46000000b0031e9dbaacf3mr1600864qtk.556.1657204157626; 
 Thu, 07 Jul 2022 07:29:17 -0700 (PDT)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006b55036fd3fsm1685514qkl.70.2022.07.07.07.29.17
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 07:29:17 -0700 (PDT)
Date: Thu, 7 Jul 2022 10:29:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: iommu@lists.linux-foundation.org
Subject: Test posting to old list
Message-ID: <20220707142915.l3ovwhpa2oo2snoj@meerkat.local>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 07 Jul 2022 15:06:01 +0000
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

Test that this will receive the auto-responder rejection.

-k
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
