Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE142AA827
	for <lists.iommu@lfdr.de>; Sat,  7 Nov 2020 23:01:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1B7AB20496;
	Sat,  7 Nov 2020 22:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9koCU5evogLO; Sat,  7 Nov 2020 22:01:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DE1E320472;
	Sat,  7 Nov 2020 22:01:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C287CC0889;
	Sat,  7 Nov 2020 22:01:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9647FC0889
 for <iommu@lists.linux-foundation.org>; Sat,  7 Nov 2020 22:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 843FC8681B
 for <iommu@lists.linux-foundation.org>; Sat,  7 Nov 2020 22:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTQ5Erivmy90 for <iommu@lists.linux-foundation.org>;
 Sat,  7 Nov 2020 22:01:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CAA5586645
 for <iommu@lists.linux-foundation.org>; Sat,  7 Nov 2020 22:01:38 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id o23so6922563ejn.11
 for <iommu@lists.linux-foundation.org>; Sat, 07 Nov 2020 14:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=pXbBQEhOWPhbo6/hMS1RgcA/HFSmRq2rXt2N0GdNgIs=;
 b=UD9HKExRkhlRCDFU5vovhxukbLsdOQYuu5xIOq+CiFMDob9sguwsH5pmX/GJ7wNYz0
 81SebbpR5nns3Ncn255hg4nud+RZgWnV4goyz3U3Napg2h26Od0pox/dE+vHoOn6Azc/
 /4Y7XXkvzkgUmgYZah3hTOeLSGZB8utvpvC/oFfqup+EbvwAL1hDp55HN5XQXe/CrlSs
 HrxXP2zGqq6DJ0/5kFU6k8iyIP3Po4SEPE27dXZl4u+nBa37EvISZgmq1qtehIEWChWk
 d091+aKwIeIAh9R1u0IynZL8VB5M3BHsNyEaC4rVjcnEj+RMufiY+7NSstx38w6pVBPM
 WHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=pXbBQEhOWPhbo6/hMS1RgcA/HFSmRq2rXt2N0GdNgIs=;
 b=dTsIP9cIepKESqt4xg9iUukrIUdj0a1e9R39s81Depy9vLV3AE1K/pBQEIKkdF8apX
 ihjNd7x5Yx6+7vCnySAcnrFjeAlfeLVXOEW1T0+1rb+yDifzJnkbOOUpsy4ICbiqYjdj
 kBeQmy6fTV8hiQ1zEm+k3tGubrmJGweWvxqEmVaIM+7hRD60Wfb1GWAa+pk1UCGGAviM
 KtW0IBEoqyFNhokj1KXOP9w2FJqP1HQjwYaF8lG/oBjAuiKL+fEEfRijPYnTx3HT+NiW
 gEpyJ0WKV7oElKd7zP/s4oxS2H3b2VI8HoSvcobY9D07p0hbZHhflFnuoi0ZlnAtePsJ
 5XCg==
X-Gm-Message-State: AOAM531TbcbsYPByV9w0wXwh3aFx8YIir2UKBE/6f8RvCVsaDMeV/I6z
 ILyO9V3Vv34EeqjK2uP0vzVZM7UUJDTYahG7DotOKvH98aM=
X-Google-Smtp-Source: ABdhPJxfYPehfdSM9GrwtSxLe0yjKKol80pTFNaeG9ZqNEINXq7h5FqrVrq4oNsscSaKYm66O8SbOnM6EaRQ5uYosBk=
X-Received: by 2002:a17:906:3b89:: with SMTP id
 u9mr8281448ejf.436.1604786497163; 
 Sat, 07 Nov 2020 14:01:37 -0800 (PST)
MIME-Version: 1.0
References: <CAGnHSEnS9OZ0i-7aL3ZuCRjNGTnUuqmbEaVN1t=WEOjUXRrUqw@mail.gmail.com>
In-Reply-To: <CAGnHSEnS9OZ0i-7aL3ZuCRjNGTnUuqmbEaVN1t=WEOjUXRrUqw@mail.gmail.com>
From: Tom Yan <tom.ty89@gmail.com>
Date: Sun, 8 Nov 2020 06:01:25 +0800
Message-ID: <CAGnHSEmh=8=vCvm1UC9O0-VTSFrhtwMBfcSF5HYAO6R+XwJRDQ@mail.gmail.com>
Subject: Re: Intel VT-d IOMMU group regression in v5.9
To: iommu@lists.linux-foundation.org
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

Basically when it is good, each pcie slot gets an iommu group and so
are the cards that are plugged into them; when it is bad, all the
slots and their cards are in one single group :/

On Sun, 1 Nov 2020 at 23:43, Tom Yan <tom.ty89@gmail.com> wrote:
>
> Hi,
>
> Please check out https://bugzilla.kernel.org/show_bug.cgi?id=209857, thanks!
>
> Regards,
> Tom
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
