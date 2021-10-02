Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5178941FD5D
	for <lists.iommu@lfdr.de>; Sat,  2 Oct 2021 19:18:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AA60404BF;
	Sat,  2 Oct 2021 17:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Oxo1VDXRMnm; Sat,  2 Oct 2021 17:18:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3940C404B7;
	Sat,  2 Oct 2021 17:18:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBFF4C000D;
	Sat,  2 Oct 2021 17:18:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDF0EC000D
 for <iommu@lists.linux-foundation.org>; Sat,  2 Oct 2021 17:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA62A84480
 for <iommu@lists.linux-foundation.org>; Sat,  2 Oct 2021 17:18:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IyTEoYpdw6c8 for <iommu@lists.linux-foundation.org>;
 Sat,  2 Oct 2021 17:18:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CD9884471
 for <iommu@lists.linux-foundation.org>; Sat,  2 Oct 2021 17:18:37 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id x124so15771322oix.9
 for <iommu@lists.linux-foundation.org>; Sat, 02 Oct 2021 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pCMhrtix1SaJdraOyPsvWpY4qULx6HH4b0l2FJCif+s=;
 b=CqeIUySNilx89Gfas5OSnD5d/nqOtklsn4cge6Lnskw9WHu6z0tpXYqThb/5oqmjba
 TmuPVhxeQPz7CBFCm0iFVtyJVeVZVdp8D38lq0Y/m18U6hhjTULrhjJ6ixCYbS/EWN1N
 6UAXVMIviH5fQqLhFOGk1SqumVaA3GiDKHzoFIfWKd5nMCNesFk4igVR9Rxi7w5tF4Xq
 lBDXij3d88iEY2KpTB6ZAFXksHWFOoo3fASPl/sBKVHBoJdEDYiH7goDt0vwaFK1O+Zi
 g0Bud3wx/cht2Ov79p+dJdBITocNtyfkHS0n5MiKlRRBwaW/IOspkHAKNX9Ecxfn/f6x
 zZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pCMhrtix1SaJdraOyPsvWpY4qULx6HH4b0l2FJCif+s=;
 b=ipPWyz2uY7kr44qFLKz7kpUlEsWoWMZ1npl1pgwfocRjJlJX0fuCXhCKXx7iSGdTyE
 RB7jmJ66dl1PxdcIYtG8cx14h+T9Y2i0oqubMC7oZLqgYdg24SSurbzNdGTtajMi/4+1
 rChmaXFPJD1X5GEsozVAiNzPQDxW3LS+u2+hwGJseaIKiINwy/OI9d4b7BG8X53ZWccT
 H+tZWd5Kh3jWMj43uK66uiNpdgmGoVa3gxXQY9YdVcoYX3Q2XWdSRg2lB7xTzOO/pQnv
 W7U8ifL6LnK1ToM/ZTCHV1tyOxAqvZVKVlTMpHRwac5aDs/8d44UGGpjf9+S7SMaKg/x
 6c6A==
X-Gm-Message-State: AOAM532ucq7kAw3x2GHScxyuwLvYRlm8Zk0mQU9XkCILvCgbTGT2B3zN
 ewZbU1bWsSBboQ4jtDNWpmR/DOusV+GQXeg4hVU=
X-Google-Smtp-Source: ABdhPJwZG5HdKsDLU1eNgRB+843KErY7M7wZ/Yvr087j5kazZZddpcsFvIfTlJuYPoieaA7sk/fHxcA8AE5VdMq6n9E=
X-Received: by 2002:aca:6009:: with SMTP id u9mr1497495oib.71.1633195116215;
 Sat, 02 Oct 2021 10:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211002124012.18186-1-ajaygargnsit@gmail.com>
 <b9afdade-b121-cc9e-ce85-6e4ff3724ed9@linux.intel.com>
In-Reply-To: <b9afdade-b121-cc9e-ce85-6e4ff3724ed9@linux.intel.com>
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Sat, 2 Oct 2021 22:48:24 +0530
Message-ID: <CAHP4M8Us753hAeoXL7E-4d29rD9+FzUwAqU6gKNmgd8G0CaQQw@mail.gmail.com>
Subject: Re: [PATCH] iommu: intel: remove flooding of non-error logs, when
 new-DMA-PTE is the same as old-DMA-PTE.
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
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

Thanks Lu for the reply.

>
> Isn't the domain should be switched from a default domain to an
> unmanaged domain when the device is assigned to the guest?
>
> Even you want to r-setup the same mappings, you need to un-map all
> existing mappings, right?
>

Hmm, I guess that's a (design) decision the KVM/QEMU/VFIO communities
need to take.
May be the patch could suppress the flooding till then?



Thanks and Regards,
Ajay
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
