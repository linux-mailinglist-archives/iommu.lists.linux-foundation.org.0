Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE322D4897
	for <lists.iommu@lfdr.de>; Wed,  9 Dec 2020 19:08:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AD9752050E;
	Wed,  9 Dec 2020 18:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVRdoaupDl12; Wed,  9 Dec 2020 18:08:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9FBB620386;
	Wed,  9 Dec 2020 18:08:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C76AC013B;
	Wed,  9 Dec 2020 18:08:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A84FC013B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 18:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 25E5087699
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 18:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dabn6jvAslH for <iommu@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 18:08:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 39AB387698
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 18:08:08 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id a12so4367721lfl.6
 for <iommu@lists.linux-foundation.org>; Wed, 09 Dec 2020 10:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Dok2Dg8TGlacaeSAxWT9P1pi2O1C9NTVB+p8kbM4WI=;
 b=h6HPKi5yzqhzOtvnkkrpaq9r4NQBJGYRD3Dwf2W7//GBglY+j4zf2PZjYJhr38VC7y
 h7VHdi5SsiKOD+OU+gixOwIY4mlkuQ0a2NsRY9JVT/FFj72jK/YaD6KIn06Jkdi/bY4e
 MlT+DNjqom65eVl5fnmry0QaMVhtjn21KrCtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Dok2Dg8TGlacaeSAxWT9P1pi2O1C9NTVB+p8kbM4WI=;
 b=ldCGSsshDD4X4utCYA+UAZZnzJeqCmpYaG8lDkZ/YhDwLQsfQ9gmL6lGAc2pcD8+Tv
 N+JwgukaG0/Ip7EnAqt2wWJNxC/d8C9WjgkNHGR3rhvkySD3QIcaDpATjn1ezd8WlHnn
 dX6wYHU2xR0CLTWyMyrLMvQ37iRPm1Xrcwk826tx1DOkofSr5NNix0n4gqv/uFv9CF0F
 45rvhrq0g9/ZJc8Ah+14dFE2077tHPd8S929ClzuzV4H+d5UZ0MMNYMhd/dcczC/wKU0
 U4DnWXbATsb8PIKDoATC+SVFp0ajUsNfAuys8NoArGW42OBONoQ4bBiGa4uGJ+OXMn4f
 zptQ==
X-Gm-Message-State: AOAM531o4+nVsSsWmE5s60ny2456iHlLOxlwYAUq4F9fFJzAdriQQqAW
 t5yRzKbhcXzbEc0GgKJTrNEarul3qT9CHAS8
X-Google-Smtp-Source: ABdhPJxO3sNGi+j3YaK8Pg603pmKsbYMEzBgh0uxWAOB5el62v9ZYay/ynTZVe8X8ZeLR833FI11eA==
X-Received: by 2002:ac2:41ce:: with SMTP id d14mr1393614lfi.114.1607537285719; 
 Wed, 09 Dec 2020 10:08:05 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id b205sm244958lfg.218.2020.12.09.10.08.03
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 10:08:04 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id 23so4338879lfg.10
 for <iommu@lists.linux-foundation.org>; Wed, 09 Dec 2020 10:08:03 -0800 (PST)
X-Received: by 2002:ac2:4831:: with SMTP id 17mr1291940lft.487.1607537283578; 
 Wed, 09 Dec 2020 10:08:03 -0800 (PST)
MIME-Version: 1.0
References: <20201209141237.GA8092@willie-the-truck>
In-Reply-To: <20201209141237.GA8092@willie-the-truck>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Dec 2020 10:07:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=wht4inbTVVMt2TNDxR_cVjSNaBU3JYyKtRMVovWePb65g@mail.gmail.com>
Message-ID: <CAHk-=wht4inbTVVMt2TNDxR_cVjSNaBU3JYyKtRMVovWePb65g@mail.gmail.com>
Subject: Re: [GIT PULL] IOMMU fix for 5.10 (-final)
To: Will Deacon <will@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>
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

On Wed, Dec 9, 2020 at 6:12 AM Will Deacon <will@kernel.org> wrote:
>
> Please pull this one-liner AMD IOMMU fix for 5.10. It's actually a fix
> for a fix, where the size of the interrupt remapping table was increased
> but a related constant for the size of the interrupt table was forgotten.

Pulled.

However, why didn't this then add some sanity checking for the two
different #defines to be in sync?

IOW, something like

   #define AMD_IOMMU_IRQ_TABLE_SHIFT 9

   #define MAX_IRQS_PER_TABLE (1 << AMD_IOMMU_IRQ_TABLE_SHIFT)
   #define DTE_IRQ_TABLE_LEN ((u64)AMD_IOMMU_IRQ_TABLE_SHIFT << 1)

or whatever. Hmm?

That way this won't happen again, but perhaps equally importantly the
linkage will be more clear, and there won't be those random constants.

Naming above is probably garbage - I assume there's some actual
architectural name for that irq table length field in the DTE?

         Linus
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
