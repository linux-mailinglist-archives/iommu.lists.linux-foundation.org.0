Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C89181DAF
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 17:24:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 62FD320BF8;
	Wed, 11 Mar 2020 16:24:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLxjxgsfNPGA; Wed, 11 Mar 2020 16:24:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 88D81214E9;
	Wed, 11 Mar 2020 16:24:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7191FC1D8E;
	Wed, 11 Mar 2020 16:24:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C8B8C0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 292838875F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qswi6gbiMg8 for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 16:24:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2322988753
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:24:43 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id f13so3059628ljp.0
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 09:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ewAlQHQt8dNmtJm6MPN3fd97uVC477VMUv7XsNvWER4=;
 b=T4CQInzmlM2NS3Aw7NWKi1zS/EPg/I3ePyu2SZ6CEEMmQlPuypdSz89daz11monzuF
 Ah+MttBb+norGtqwBrEU/TbbOCS32LF7TwYCBY95bzhG0y61XDLQQ5mVUplCZol/nK1C
 guY8cMZZTIhfPI/ExVsw1ygxAVbRY1ifDJhlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ewAlQHQt8dNmtJm6MPN3fd97uVC477VMUv7XsNvWER4=;
 b=bW69+J1NCS3YzlxVhThx2UYP+AdCGCnqpONfoqpG10gxA2vM6JdFJHsaPeIl2tESUi
 zDxzRm0khi24Id78cH3D1n7whOCCUKjzhxALlr3298TLCKZWoRFv3h1rKRCW9yTC4v15
 pslZz4DSeruM3T90CTP9WBC1C4Tia/SHJSxUjanVI3SHDepayI+fwWAyC65B0dqBmIjm
 MJRWawOcKbe2OAHXKArCFeaPyZyw7q0YcUKilEr/ej6kgJTy34TbCUBP4B180Z3rv1hV
 bYrVFPFoLWdsB5Wn1ajYXpOvp6bgiqr43iKSXLumgm4UowFRvMXfvCrNm/a8qZjIB4/4
 ApsQ==
X-Gm-Message-State: ANhLgQ2WEf2XJ7Xavgq24Qcjq4u4SmCkLtWxQ/LAZ3kc/mK657jccFHK
 +rCDcivhTAAV0Wdz/cA3HsI0NnIxILrk+w==
X-Google-Smtp-Source: ADFU+vs9zaUgwcreYQXLa2BoHjpvHtOxAaxzzPhpJWE+yeEkhCXWsu7V3dWqefM/1QFM1yNrJ0DB2A==
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr2605322ljh.192.1583943880482; 
 Wed, 11 Mar 2020 09:24:40 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id o17sm9430636lfd.89.2020.03.11.09.24.39
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 09:24:39 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id s13so3053350ljm.1
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 09:24:39 -0700 (PDT)
X-Received: by 2002:a05:651c:230:: with SMTP id
 z16mr2626766ljn.201.1583943878724; 
 Wed, 11 Mar 2020 09:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <bug-206175-5873@https.bugzilla.kernel.org/>
 <bug-206175-5873-S6PaNNClEr@https.bugzilla.kernel.org/>
 <CAHk-=wi4GS05j67V0D_cRXRQ=_Jh-NT0OuNpF-JFsDFj7jZK9A@mail.gmail.com>
 <20200310162342.GA4483@lst.de>
 <CAHk-=wgB2YMM6kw8W0wq=7efxsRERL14OHMOLU=Nd1OaR+sXvw@mail.gmail.com>
 <20200310182546.GA9268@lst.de> <20200311152453.GB23704@lst.de>
 <e70dd793-e8b8-ab0c-6027-6c22b5a99bfc@gmx.com> <20200311154328.GA24044@lst.de>
 <20200311154718.GB24044@lst.de> <962693d9-b595-c44d-1390-e044f29e91d3@gmx.com>
 <CAHk-=wj0E9vCO_VTiK6xuXAW13ZeeLsW=G3v+yNsCaUm1+H61A@mail.gmail.com>
In-Reply-To: <CAHk-=wj0E9vCO_VTiK6xuXAW13ZeeLsW=G3v+yNsCaUm1+H61A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Mar 2020 09:24:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=whFu_p-eiyJfiEevV=a+irzW=9LMWjMaaFSaaasXout9w@mail.gmail.com>
Message-ID: <CAHk-=whFu_p-eiyJfiEevV=a+irzW=9LMWjMaaFSaaasXout9w@mail.gmail.com>
Subject: Re: [Bug 206175] Fedora >= 5.4 kernels instantly freeze on boot
 without producing any display output
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu <iommu@lists.linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Wed, Mar 11, 2020 at 9:21 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> It's commit e423fb6929d4 ("driver code: clarify and fix platform
> device DMA mask allocation") in my tree. I've not pushed it out yet (I
> have a few pending pull requests), but it should be out shortly.

Actually, looking at other emails in my mailbox I see that Christoph
send a patch with a sign-off, and there's a reviewed-by too, so since
I haven't pushed mine out yet, I'll edit that up and give credit to
Christoph properly, and add the reviewed-by.

So it will have a different commit ID, updated message, and be a mix
of my patch and Christoph's.

             Linus
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
