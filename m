Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EA09C181DA3
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 17:21:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 962322107F;
	Wed, 11 Mar 2020 16:21:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TyDqQdnATs1k; Wed, 11 Mar 2020 16:21:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0D6AE20C92;
	Wed, 11 Mar 2020 16:21:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE8EAC0177;
	Wed, 11 Mar 2020 16:21:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E77EDC0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D641A20C92
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GBWr1rEJg5f for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 16:21:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by silver.osuosl.org (Postfix) with ESMTPS id D38EB20BF8
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:21:21 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id f10so3010868ljn.6
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7wRqHRwvmYRYhmXsXy7AGGNNPT7p4XfIy/7Zs7myQjo=;
 b=R9KvMInv77iX75P+5glKEo9kPqEMRGzLlaxu3ohT58/6av82nvhnJvOlEcEUcDT5wN
 YRKRjUGHZSsPrGgKB0nbdUcBjc28d8DP/JR59fN5slvamddNiORZmLU5oaRlZKiR5jaI
 5NQmxVAML+zK/53hVUBPZ7w/J8mtqfs9e3N2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7wRqHRwvmYRYhmXsXy7AGGNNPT7p4XfIy/7Zs7myQjo=;
 b=jEKUJoWMscQZ2Ol5B1xq5uwDisGdQhiZ/XpbU5wyZAWL4OHKY1XiB50Pw2/4n7VDxk
 55/R8TvsCS3RGWAxAapGqK4O3eIYS7/Vb6feI1lyeQ65K2H0HH7Xc/CAPYWHtwwXe3EV
 o9I/PCiUJlDWmtYuP9Qn1qp25qu6XnThM71fRs3/TM7/UaTa3ZYD0F63YYZVRkhh8MJS
 GvaOqXrRPFAVLaqjfkVWbO0c3bBbFAUFtsLDTk07n0E+SihUKn2T1y1kn6qKALDRR6IM
 /xmi3TXCXuWvBTyGU7E39RjERkJDiJG8YIKVnwFpl5jr0Wxs2iYFSA0xb1o2xzVHfhxU
 s3JA==
X-Gm-Message-State: ANhLgQ3k1dGZA+4PPCdtChpSVlP5x8hGUcsesK4yNWtlGyHHgn24bmO9
 koem86ZgXQGxk5+pqYWa/zHk9ITtvJZG1Q==
X-Google-Smtp-Source: ADFU+vuxKkmhLJrgGPd0mxGq15XWhbRSESPuqdt4cpZh0OO5BNYdh9fZq/gN4vy7R+5ijKGCw4fIOg==
X-Received: by 2002:a2e:b60d:: with SMTP id r13mr2521003ljn.185.1583943678856; 
 Wed, 11 Mar 2020 09:21:18 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id s17sm21776659ljd.70.2020.03.11.09.21.17
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 09:21:17 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 19so3006837ljj.7
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 09:21:17 -0700 (PDT)
X-Received: by 2002:a2e:6819:: with SMTP id c25mr2633970lja.16.1583943677157; 
 Wed, 11 Mar 2020 09:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <bug-206175-5873@https.bugzilla.kernel.org/>
 <bug-206175-5873-S6PaNNClEr@https.bugzilla.kernel.org/>
 <CAHk-=wi4GS05j67V0D_cRXRQ=_Jh-NT0OuNpF-JFsDFj7jZK9A@mail.gmail.com>
 <20200310162342.GA4483@lst.de>
 <CAHk-=wgB2YMM6kw8W0wq=7efxsRERL14OHMOLU=Nd1OaR+sXvw@mail.gmail.com>
 <20200310182546.GA9268@lst.de> <20200311152453.GB23704@lst.de>
 <e70dd793-e8b8-ab0c-6027-6c22b5a99bfc@gmx.com> <20200311154328.GA24044@lst.de>
 <20200311154718.GB24044@lst.de> <962693d9-b595-c44d-1390-e044f29e91d3@gmx.com>
In-Reply-To: <962693d9-b595-c44d-1390-e044f29e91d3@gmx.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Mar 2020 09:21:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0E9vCO_VTiK6xuXAW13ZeeLsW=G3v+yNsCaUm1+H61A@mail.gmail.com>
Message-ID: <CAHk-=wj0E9vCO_VTiK6xuXAW13ZeeLsW=G3v+yNsCaUm1+H61A@mail.gmail.com>
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

On Wed, Mar 11, 2020 at 9:02 AM Artem S. Tashkinov <aros@gmx.com> wrote:
>
> With this patch the system works (I haven't created an initrd, so it
> doesn't completely boot and panics on not being able to mount root fs
> but that's expected).

Perfect.

I ended up applying my earlier cleanup patch with just the added
removal of the kfree(), which was the actual trigger of the bug.

It's commit e423fb6929d4 ("driver code: clarify and fix platform
device DMA mask allocation") in my tree. I've not pushed it out yet (I
have a few pending pull requests), but it should be out shortly.

           Linus
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
