Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D72710CEE6
	for <lists.iommu@lfdr.de>; Thu, 28 Nov 2019 20:30:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1DE488697D;
	Thu, 28 Nov 2019 19:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mf6cMB0vYFyC; Thu, 28 Nov 2019 19:30:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E3A9868BC;
	Thu, 28 Nov 2019 19:30:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E486C1DE5;
	Thu, 28 Nov 2019 19:30:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39D25C0881
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 19:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2148887BFF
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 19:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8LhyDsqwxKhV for <iommu@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 19:30:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 96E4287B82
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 19:30:32 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d7so11945950pls.3
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 11:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=osQYL3pDmdl2TaeiizJjLXstEKC6lN2gc0hqrN0LReo=;
 b=ZKrcbzETQZZWRqIYJledPltEAabffGiHBHmsWpqhA3DhqMOfYykL/UKFaj4TlaTFPQ
 cT2yGt+4cZUho070NFk5pGh9MqUmW+77WyX5g+iZTRvEsZxvPB8XRxvPuUa/7y9Y04Tr
 AhuI0MXadMjWOBObLW1CjunbGMNDbJRgegD44D4WZnl95K5nSLQkP7h2eWihj1Oxj6s5
 X5TOzjxVJOLVNbk+2QrCWGjkYUqVdwPWlD2c8iZqWfINAH4CH5h10aS/T8NurrbaL+Sf
 yra8IyywQPn8avMXOl2e5jtNw6HEbX1JaCfMIgWuWZMvO/RyzaXPDbHsDY6rHm38Ht9x
 UE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=osQYL3pDmdl2TaeiizJjLXstEKC6lN2gc0hqrN0LReo=;
 b=ZgtKRjJN2PpWedUqdxSdVS1gNuAYus9IY+fxWeH8j157ySkfkIjllxYonUrojvJnYL
 IQD0A13dhVFQ/8oP1Mw9a/hU/nkyxdyd8rlI0nRD8mX1xEAF4Cz3TIQwVVZgUtrzrneK
 SjeCvbgCw2XBinl4hjkvb4ueh+XYWz0ijzE0ZLFrh34TqLerDGbSKJmed1F1MotPsNgl
 zr7frutMXbXB4ftp0F2jbe76nJvxTivrNyoyQPdlIDyCMeiE3JJn8dwbFPQZIJIrOWOn
 UpX88l51ApQlzg0Y7oTGKk6kJJxxfk+iYydJ0jXj3kMZQPtHszEH2dGwadvkNKPEFMLY
 vo5g==
X-Gm-Message-State: APjAAAXsS7NAk95wwj7n0ao3uTawLQcip2iyAH263hpIKZXsrKsZ1+I/
 EZt0Nwzm5AS0PrEwI4DWGC2kmfslBgIBch92GSI=
X-Google-Smtp-Source: APXvYqx2ILVRxzHZL7JR3+vRmSwtPzN2gRVKmlweVhtEix33SJgqggQn4Stkk4g/PaKIo8UPJmOpcirO1H0rnSK6+Ro=
X-Received: by 2002:a17:902:34d:: with SMTP id
 71mr10523489pld.316.1574969432079; 
 Thu, 28 Nov 2019 11:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20191121001348.27230-1-xiyou.wangcong@gmail.com>
 <20191121001348.27230-2-xiyou.wangcong@gmail.com>
 <9ac29292-bc3d-ae57-daff-5b3264020fe2@huawei.com>
In-Reply-To: <9ac29292-bc3d-ae57-daff-5b3264020fe2@huawei.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Thu, 28 Nov 2019 11:30:20 -0800
Message-ID: <CAM_iQpVqs2zLxnwC3p81qv-n8tq8vQ6DJRGE9zwMJNm-vULZAA@mail.gmail.com>
Subject: Re: [PATCH 1/3] iommu: match the original algorithm
To: John Garry <john.garry@huawei.com>
Cc: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>
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

On Wed, Nov 27, 2019 at 10:01 AM John Garry <john.garry@huawei.com> wrote:
>
> On 21/11/2019 00:13, Cong Wang wrote:
> > The IOVA cache algorithm implemented in IOMMU code does not
> > exactly match the original algorithm described in the paper.
> >
> > Particularly, it doesn't need to free the loaded empty magazine
> > when trying to put it back to global depot.
> >
> > This patch makes it exactly match the original algorithm.
> >
>
> I haven't gone into the details, but this patch alone is giving this:
>
> root@(none)$ [  123.857024] kmemleak: 8 new suspected memory leaks (see
> /sys/kernel/debug/kmemleak)

Ah, thanks for catching it! I see what I missed, I should pre-allocate those
empty entries in order to make it work correctly.

I didn't catch this because this was tested on a production machine where
we can't afford CONFIG_DEBUG_KMEMLEAK=y for obvious performance
concerns.

Anyway, I will fix this and send v2.

Thanks!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
