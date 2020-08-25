Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C63662511D8
	for <lists.iommu@lfdr.de>; Tue, 25 Aug 2020 08:02:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DD8B722718;
	Tue, 25 Aug 2020 06:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cK0TtBYfq3Wt; Tue, 25 Aug 2020 06:02:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EEB4F226F5;
	Tue, 25 Aug 2020 06:02:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C36E4C0051;
	Tue, 25 Aug 2020 06:02:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3200EC0051
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 06:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 26C8287841
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 06:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHB0vxGwT2YJ for <iommu@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 06:02:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0659686BAD
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 06:02:31 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id d26so4816134ejr.1
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 23:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=qC9lIs0ZMoKFIjAQ0dU6hymT0FL8xlJ8yoO3siCb5Ck=;
 b=ikjYeM4IpIjVvaDRvrGRwBZ//8j+vKTQRqv04vDMB6WSfGp8WqCimzdUeZZNLo2RhH
 GgFcLSppsiEJNu5l6rVe/50vcA2UyaAExdtuiwxGDAS1PdqVI+giIoFnLmCeVvK6iUx1
 P0+y+spVBwOx3hs1MoodeMaSJZS5ytZ3vcJoJoL0KhA7FHCPyVb0SoU0Q7CLsvjVPT4Q
 UxrU1Xfp3xZJjlTVkRfKF9g2O3vxXJuTekQ6tzgRqBh81TyGKi1bsO701FDB5i0l4jcE
 /M9iNSKhYXscRbvYpWFKW6L0ZDE4T5zGjAdLkiUAmIR7Gh/dMW5JEjcx2A3Vb4h5GHig
 FBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=qC9lIs0ZMoKFIjAQ0dU6hymT0FL8xlJ8yoO3siCb5Ck=;
 b=j0ON7yFmzw95w2tW0xa7o4Nqb3QVhomMnNi2ZW9eFnOD5upb4EQHUADN6N139vA2x3
 tGTBkkDK7KdA5XSq5SI5Y9kZCEx+EiXrdiY7dgD9ZJlQb0HVCCa57i1fPFh44Hdvb0Yn
 Xn+aMY5Z6XPgB7fRAONKmZehvJXeFf8uxAJX0an0ldrCCJXIL0MilEkC4Ctyqmzg58LE
 kFuHUT8RmA7TjOXH79MBo2FhRyTsATWhqMp9LZiTcoAqzcI2DyQ9ThZXnePUMBMl890L
 w8q8YXjYgnI/bi6MaMi9h7h/OsxdHeIwBj6H4sN5s6D65qX2JIIIJxYqAxbRzEyXCPbG
 qOPw==
X-Gm-Message-State: AOAM531zz9JVGfuf/SFBOz2Xswly3PN/pI+thMo20qBXP3FjlrUewt4c
 0btyC4KKL34csr1xPojgAB0=
X-Google-Smtp-Source: ABdhPJx7BcwdkWuyTL1fcGA4WKrD1Ua/Boe3SCTZg3mXO1upBsJa6ovPylNYOLvY4VRa3hj6TVJd7A==
X-Received: by 2002:a17:906:3e0a:: with SMTP id
 k10mr9384552eji.148.1598335349584; 
 Mon, 24 Aug 2020 23:02:29 -0700 (PDT)
Received: from felia ([2001:16b8:2d83:7500:a091:6d55:fb72:2347])
 by smtp.gmail.com with ESMTPSA id h16sm12541220ejf.120.2020.08.24.23.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 23:02:28 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 25 Aug 2020 08:02:21 +0200 (CEST)
X-X-Sender: lukas@felia
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: update QUALCOMM IOMMU after Arm SSMU drivers
 move
In-Reply-To: <20200821161101.GF21517@willie-the-truck>
Message-ID: <alpine.DEB.2.21.2008250801050.5419@felia>
References: <20200802065320.7470-1-lukas.bulwahn@gmail.com>
 <20200821161101.GF21517@willie-the-truck>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-arm-msm@vger.kernel.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-team@android.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>



On Fri, 21 Aug 2020, Will Deacon wrote:

> On Sun, Aug 02, 2020 at 08:53:20AM +0200, Lukas Bulwahn wrote:
> > Commit e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own
> > subdirectory") moved drivers/iommu/qcom_iommu.c to
> > drivers/iommu/arm/arm-smmu/qcom_iommu.c amongst other moves, adjusted some
> > sections in MAINTAINERS, but missed adjusting the QUALCOMM IOMMU section.
> > 
> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> > 
> >   warning: no file matches    F:    drivers/iommu/qcom_iommu.c
> > 
> > Update the file entry in MAINTAINERS to the new location.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > Will, please ack.
> 
> Typo in subject: s/SSMU/SMMU/
> 
> With that:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> > Joerg, please pick this minor non-urgent patch for your -next branch.
> 
> Joerg -- can you queue this as a fix for 5.9-rc, please?
>
Will, Joerg, I addressed the typo.

Ignore PATCH v1; and take v2 instead:

https://lore.kernel.org/lkml/20200825053828.4166-1-lukas.bulwahn@gmail.com/

Thanks,

Lukas
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
