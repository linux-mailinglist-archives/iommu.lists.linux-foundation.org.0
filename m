Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AABE181F6E
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 18:27:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CE81789387;
	Wed, 11 Mar 2020 17:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJg7W0vxiNMc; Wed, 11 Mar 2020 17:27:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6A9EF89386;
	Wed, 11 Mar 2020 17:27:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FF05C0177;
	Wed, 11 Mar 2020 17:27:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8EF9C0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 17:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C57372201C
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 17:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7N5fNFPr108T for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:27:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by silver.osuosl.org (Postfix) with ESMTPS id C69AD203C9
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 17:27:51 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id q9so2413681lfc.10
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 10:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u6sQSsi3UobD+SiMyauoIL5YpFnOKCsVWdR687lY+ao=;
 b=NJYDNI6MqJAuLHpRl9YLDtRo4dN9HMkarsiN1uMKPDOb3afVGpwPtCRqkGSUNF4kTh
 DuT1S09TVZrg8COFoWRDf5FT4BFBjn1MchXIuuUT5KRNuKaUma3aHeT5KIPl5SJ+sXwF
 eEyxd7XlyaC4c5fm3Ud6HJ7nspp6krpFIF+OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u6sQSsi3UobD+SiMyauoIL5YpFnOKCsVWdR687lY+ao=;
 b=Fdygg1/7JyS3roiGbGgx8eDv3t3u8W+D8SJJYQS2m/xeHDjCSkOYVVJK8NqUFjfgv4
 Tj3f+Uqul+w9WjS6XHed9HOy5N2xkLxye/vf3UtsREq5Pltyc3A0lfj0ng87shGMpXCg
 1tZ2XjI1i2pCIQsNB1bjlvwo+ouePf7R3Zet7p7z6ehbFtqSqmsU1uYhBNqCIXwBVYyL
 UoI8wiFwbROoTkIkhmP0YC2tOUPgBy4I+UQ/Gf94fcxDNSMYd4i7Wx4Ec69nNRaBQKrV
 imwsiv3zGjYX32vMBE4qVBvota/33rhTH1Q5in12O/HaPAtr9q0ZMygJAXiHviG0kn2Y
 5oMw==
X-Gm-Message-State: ANhLgQ2QKD2wyKvwGcwtr1n9An5Zy6SMBSEvI9o2U1wyU6XI3fhrWqWn
 enud5KnwkqXq3yQGPxXtgVptkhACLYszHg==
X-Google-Smtp-Source: ADFU+vtU/f+ivZffQl4aKj2jYC2Hy8PYtrrC8OT7KeauP7K4hMcrDgWOBvlnH4WzRkyZKoYu0eyMIA==
X-Received: by 2002:a05:6512:50f:: with SMTP id
 o15mr2747772lfb.216.1583947669350; 
 Wed, 11 Mar 2020 10:27:49 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id x23sm206545lfc.19.2020.03.11.10.27.48
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 10:27:48 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id c20so2451762lfb.0
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 10:27:48 -0700 (PDT)
X-Received: by 2002:ac2:5203:: with SMTP id a3mr2792496lfl.152.1583947667785; 
 Wed, 11 Mar 2020 10:27:47 -0700 (PDT)
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
 <e97de44a-39b0-c4fa-488c-d9fa76eb1eae@gmx.com>
In-Reply-To: <e97de44a-39b0-c4fa-488c-d9fa76eb1eae@gmx.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Mar 2020 10:27:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=whBLLdMH2-qu3_ZkQjX3zXNmmDHWSoO_=mLBbzzQ5O0yg@mail.gmail.com>
Message-ID: <CAHk-=whBLLdMH2-qu3_ZkQjX3zXNmmDHWSoO_=mLBbzzQ5O0yg@mail.gmail.com>
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

On Wed, Mar 11, 2020 at 10:21 AM Artem S. Tashkinov <aros@gmx.com> wrote:
>
> I've been able to compile and run
> e3a36eb6dfaeea8175c05d5915dcf0b939be6dab successfully. I won't claim
> this patch doesn't break something for other people :-)

Thanks, that's all I was looking for.

If it breaks something for somebody else, I have a solid plan for that
too: I'll just sit in a corner and cry.

               Linus
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
