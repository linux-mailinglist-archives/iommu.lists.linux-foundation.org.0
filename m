Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B126D2E903C
	for <lists.iommu@lfdr.de>; Mon,  4 Jan 2021 06:44:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4918F87097;
	Mon,  4 Jan 2021 05:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nog4TfM3ggJM; Mon,  4 Jan 2021 05:44:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 70A0787032;
	Mon,  4 Jan 2021 05:44:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56F50C013A;
	Mon,  4 Jan 2021 05:44:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEE87C013A
 for <iommu@lists.linux-foundation.org>; Mon,  4 Jan 2021 05:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B587385091
 for <iommu@lists.linux-foundation.org>; Mon,  4 Jan 2021 05:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P4fgguWVU45P for <iommu@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 05:44:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 60A108453F
 for <iommu@lists.linux-foundation.org>; Mon,  4 Jan 2021 05:44:06 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id d8so25045223otq.6
 for <iommu@lists.linux-foundation.org>; Sun, 03 Jan 2021 21:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kt1M/ynVaCrBy4bUG8dbX69hdMW01aGM4CaNYhUhdpM=;
 b=FLqE6jiXowzgMP4GH7Xv6ZcS7S6iThN80zqyvlTa+l7FmIELG4FNqZuWapSfjvRB8D
 es4DlowG5MaUcPllm5//iqYd/v0hmMSpkCHH7hZzihbz7C3Yn5qC3j54l7yEIRVUEknY
 QFN6ev0lIPbRgv3kxxL+CPYNEyvX8Jjw1IXZ4YAjcMyfi9vv1tTFHyX9QTwlmZnn8JkI
 Nh7Cad1zHbvSWFvuVPZNggffvyPgRc2t3CHhAfkdh7w/5UjBmzKXFCRkHKcxziSnq0Mu
 qAQAayE14boIYOoeRcpAqVX0NuwLT5TmvxKxKrk0og/Mjv66cuhrHlw4iASoOqtYJb01
 SU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kt1M/ynVaCrBy4bUG8dbX69hdMW01aGM4CaNYhUhdpM=;
 b=Rl6FNh7s2L/KVU4F524cqQP4H+nyUBbXs8TeGbI2tqPPLyQLATXe7ZINVRt9QiYbVI
 E6/V6Nan/mI9csS+rLL0jR8M6x4Aw2OckyzdYtdV6QqY/GyjbhebhLSQFXYcVfGABrlP
 sBkREo1swXEN0BfkO6LwkYrkv6c6nT8o5EMy5IYUpp4Paqvw40aLkA8JgFnh6O3A3dXy
 J2xFhCAd8Dy5zedqWl9YFn3Mk62d4uBUDvf8ZBiCm3LN+Lm68u68bzXu7Kj0svGKtDhP
 JmD3Mp9KZDaWSEhiLfmIEA/KPN6Gqj+G+g5w7qoPAOenS8xlV/D91ul8jh81xlQfSBRr
 mQpg==
X-Gm-Message-State: AOAM531A3D37Ic02SOCnsxpih2z66GNKnZPowpoqCVRuujqLpuYk/57A
 em/QpiA0OIsfTIckKsk/Ko+DhK8UFNhzqszjjA0=
X-Google-Smtp-Source: ABdhPJyAbAZwtZn4YjrMTLj3XTNFWx/7IisbpiJXSPsbL428ayXQlssmKy1arLj7kDgbpt0H5gHbH6el2vCPI1nFT40=
X-Received: by 2002:a9d:7504:: with SMTP id r4mr43330373otk.245.1609739045420; 
 Sun, 03 Jan 2021 21:44:05 -0800 (PST)
MIME-Version: 1.0
References: <20201223062412.343-1-zhenzhong.duan@gmail.com>
 <20201230070244.GA22022@zn.tnic>
In-Reply-To: <20201230070244.GA22022@zn.tnic>
From: Zhenzhong Duan <zhenzhong.duan@gmail.com>
Date: Mon, 4 Jan 2021 13:43:53 +0800
Message-ID: <CAFH1YnMDqmOayVU8gahmndCgZtVic2JBqfoH5VQCcyya0UfCLQ@mail.gmail.com>
Subject: Re: [PATCH] x86/iommu: Fix two minimal issues in check_iommu_entries()
To: Borislav Petkov <bp@alien8.de>
Cc: will@kernel.org, konrad.wilk@oracle.com,
 David Woodhouse <dwmw2@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, joe@perches.com,
 Thomas Gleixner <tglx@linutronix.de>, zhongjiang@huawei.com
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

On Wed, Dec 30, 2020 at 3:02 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Wed, Dec 23, 2020 at 02:24:12PM +0800, Zhenzhong Duan wrote:
> > check_iommu_entries() checks for cyclic dependency in iommu entries
> > and fixes the cyclic dependency by setting x->depend to NULL. But
> > this repairing isn't correct if q is in front of p, there will be
> > "EXECUTION ORDER INVALID!" report following. Fix it by NULLing
> > whichever in the front.
>
> When does "q is in front of p" happen? How does it happen?

Sorry, just realized it never happen.
>
> > The second issue is about the report of exectuion order reverse,
> > the order is reversed incorrectly in the report, fix it.
>
> I have no clue what that means.

I mean if p depends on q, then q->detect should be called before p->detect.
The message generated by printk() is wrong.

Regards
Zhenzhong
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
