Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B08135054
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 01:12:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D23A385E1A;
	Thu,  9 Jan 2020 00:12:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XDu8w+7W33OS; Thu,  9 Jan 2020 00:12:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 653D685C92;
	Thu,  9 Jan 2020 00:12:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56D0AC0881;
	Thu,  9 Jan 2020 00:12:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 530C1C0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 00:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4A0B685E1A
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 00:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7WhQjDADHmhJ for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 00:12:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E75A685C92
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 00:12:09 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id u71so5182140lje.11
 for <iommu@lists.linux-foundation.org>; Wed, 08 Jan 2020 16:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HVisVu8Wu16SaV0sMk02ztxQIapwngY7zLo/9cnABCc=;
 b=XUDOO5DY3262d2IJmumtCx22lNnoppf1k5ufC7HZTJFrfOSdDnWOlpDHI0ssmNc4YB
 ne16jNcNOQLoizNoz9JCCK4trqCEZSPJ3wThkigLYcrewidhlr+VBp4eaGMXdslJfgle
 Zs+sKuKi55esVdZo0pdg3QoE9UHXzWDjqI3yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HVisVu8Wu16SaV0sMk02ztxQIapwngY7zLo/9cnABCc=;
 b=LUTJuTJfvybEU5NiW5DpJsoT8SeEcQQhO1oPBoQOZ+ma3EWuaCPm/68L39rsy45BuK
 vnOL3CqFLqMsK1I+JKZE/9wPW9Lk89wmXQMPntkhqq8j4UmwWwW6h+CX1qwmXdCaUjs3
 Ntnyhc676xQQDn5rL7SUAce4Mwf2XmYQt1n060F2X5InFFrEB2eGnT9VHFEYbZfFUXvp
 vx/lWakDdQZjailMW9m2fLonkMRY+BJra7/Ef6ZVViL+wFEXqrtnza22veLGkhdap85H
 aZ3KjoqYajQve5xCiESvwPEfg2KAiFoHCavwiFtA4mcOGMf614NyoNyKYmmQLhs/1Dnx
 Kk7g==
X-Gm-Message-State: APjAAAW1LL/fcLS7I59bkd94df/Lsr9ZTVUA+6wO5qyfNNsbOKaHy1dm
 oRbtNaDjnO06WcW8NQnE6A0I4/p08rf8r3nIAU0yiw==
X-Google-Smtp-Source: APXvYqyWBiiYYqMZHL40C2vNMJcjbCMBWhOk87f2KkWGotCyAzrOc8DUic3Cc0t1c/R2ONmLwLmABmWBUxiQZtKqR6M=
X-Received: by 2002:a2e:9a01:: with SMTP id o1mr4303478lji.247.1578528728012; 
 Wed, 08 Jan 2020 16:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20200102001823.21976-1-baolu.lu@linux.intel.com>
 <20200102001823.21976-23-baolu.lu@linux.intel.com>
 <CAL1RGDWU=s6nVArvkci1cXyZVw-fvdtcOjuY+9E+rgBi65q=Aw@mail.gmail.com>
 <567f1506-4a13-535b-ce41-aac079941510@linux.intel.com>
 <CAL1RGDVF1icaeEWMe0r0VA8AaxtHGJZ8NHCpvJfT8+1duOUYAQ@mail.gmail.com>
 <20200106170551.ykphn6couhxozrid@cantor>
 <799d7ab1-c496-e3f8-719e-e52fbabb8d1c@linux.intel.com>
 <20200107013056.pec2cz5zhazam4ra@cantor>
 <10ae1926-2160-71df-1829-f855b2611cf8@linux.intel.com>
In-Reply-To: <10ae1926-2160-71df-1829-f855b2611cf8@linux.intel.com>
Date: Wed, 8 Jan 2020 16:12:25 -0800
Message-ID: <CAL1RGDV2q0SFDQCjYoZ3BWU4MstPJ5OJ4bMdA8Rphxis_BUQ+Q@mail.gmail.com>
Subject: Re: [PATCH 22/22] iommu/vt-d: Add a quirk flag for scope mismatched
 devices
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Jim Yan <jimyan@baidu.com>, iommu@lists.linux-foundation.org
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
From: Roland Dreier via iommu <iommu@lists.linux-foundation.org>
Reply-To: Roland Dreier <roland@purestorage.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

> Are you willing to add your reviewed-by for Jim's v2 patch? I will
> queue it for v5.6 if you both agree.

Sure:

Reviewed-by: Roland Dreier <roland@purestorage.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
