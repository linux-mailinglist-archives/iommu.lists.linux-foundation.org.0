Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 98278279169
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 21:26:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E41D86EAF;
	Fri, 25 Sep 2020 19:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M+H9Aj9KKhnx; Fri, 25 Sep 2020 19:26:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3528386EA3;
	Fri, 25 Sep 2020 19:26:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11EE8C0051;
	Fri, 25 Sep 2020 19:26:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7C7AC0051
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 19:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B08B686EA3
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 19:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UNBhDaIQlHrF for <iommu@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 19:26:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F3F8886EB9
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 19:26:40 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id r9so4135968ioa.2
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 12:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3JF4yPnp4JTi+/MHrKogyuI7nkofHddgH0FgyoYHlHs=;
 b=XOq9Hu0z7Nxjy9g8sQ2fSc81MwUTKAUr3ZzhcXAWaeHtwyEvMCnbKn72/LcWYkQcfe
 WsFKuG5/1Btxz1BOkSskKM2EUzlfjsIZputb/hZzGyVMUGFjsufth7k91D5pYMbn+jgm
 rmzwLTK5Jq05XvjHfLhpwPNgIBlxUoKEWE82cvI+MjdA8BhKcOBFUg/GTFcLnMtIjJVz
 KLW2QrDkW0SZaY9fsSZ8StcvjR+jBxLmcL22m0n1KoSRIgwQ50TsN4w9mBEjqh8toatD
 JqiOLsaSCa+2cQGBWWCUtsuRQEI73oolekAdIVvtXNdXC+HJIooD+ctlAkc12y5KcaUH
 o5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3JF4yPnp4JTi+/MHrKogyuI7nkofHddgH0FgyoYHlHs=;
 b=Ab3JHaXr6vvdQ55Nnmyw21UCPi1O494A8qNyf8OrfeLGQlyNKGjUtc9yQGFEcOnVVW
 5HVfPEQ2e5XlzGbDw9jobGAKxD9hZBA4z+qSF6v9n1Ge8CdVxca6oMSZOX6l9he9JLtw
 1q8nMCg/MZezin5buvWTRLo+Mo+iipDrhr+1r8E383JygqJkg4aXaTUzrzakMOAtPyI/
 3h31ulVrxwRu5QtvECiJ/2U7l9aRy+7WQsVzs0S44GNZvzmnGmp5kjrPwHb/MamyQvXy
 uKTYwOCA9d7hN/FIqSpQ+FTBWRj8cdo0AUQb8PWDpJ9sRmQ3lVN9fJNGOiynN1ysyQeN
 /mSg==
X-Gm-Message-State: AOAM5333PC8YtnrupuXdKvQA3ksfMXhhNy6fMwxvyrnPfBrjD5ArHNjG
 xx55e8lufkDWOJd8T0ZPDBuYssjVvub+d7wjK4A=
X-Google-Smtp-Source: ABdhPJzpRwmQRavL4njMYs0WOTaLb65+LcLZkmI03ChwKy2LzOKgq6PH8fEOmz9DcHCpU4EuCEjuKXrZvBAe0feRlL8=
X-Received: by 2002:a02:b199:: with SMTP id t25mr494691jah.124.1601062000321; 
 Fri, 25 Sep 2020 12:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <1601027469-221812-1-git-send-email-john.garry@huawei.com>
In-Reply-To: <1601027469-221812-1-git-send-email-john.garry@huawei.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Fri, 25 Sep 2020 12:26:28 -0700
Message-ID: <CAM_iQpUowPbuqx7-LsZTZ71KxTPpXAUqYU5+aWPy+qv0U2BqTg@mail.gmail.com>
Subject: Re: [PATCH 0/2] iommu/iova: Solve longterm IOVA issue
To: John Garry <john.garry@huawei.com>
Cc: linuxarm@huawei.com, LKML <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

On Fri, Sep 25, 2020 at 2:56 AM John Garry <john.garry@huawei.com> wrote:
>
> This series contains a patch to solve the longterm IOVA issue which
> leizhen originally tried to address at [0].
>
> I also included the small optimisation from Cong Wang, which never seems
> to be have been accepted [1]. There was some debate of the other patches
> in that series, but this one is quite straightforward.
>
> @Cong Wang, Please resend your series if prefer I didn't upstream your
> patch.

Thanks for letting me know. But I still don't think it is worth any effort,
given it is hard to work with Robin. Users who care about latency here
should just disable IOMMU, it is really hard to optimize IOVA cache
performance to catch up with !IOMMU case.

So, please feel free to carry it on your own, I have no problem with it.

Thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
