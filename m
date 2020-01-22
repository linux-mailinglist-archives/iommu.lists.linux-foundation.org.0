Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BAF145B18
	for <lists.iommu@lfdr.de>; Wed, 22 Jan 2020 18:45:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D1F9586126;
	Wed, 22 Jan 2020 17:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DU08q-lIP_rH; Wed, 22 Jan 2020 17:45:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 00B1A86121;
	Wed, 22 Jan 2020 17:45:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DABACC0174;
	Wed, 22 Jan 2020 17:45:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C45AAC0174
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 17:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B31A086109
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 17:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MOfa0zhyVePe for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 17:45:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2B892860F9
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 17:45:37 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id a15so120307otf.1
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 09:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivphs1bWTObb7J+zazB6Vb2JyrITy24SYHszLm1C3fk=;
 b=eC5VDs/zXzC6Xiwfplai4oYrOJ9acBxzctsK96/Au4UsFmQduairzK2x1GST/qZobD
 lVQrwQjMKG1Bxcr5xP3shUaPn0KHngTd+Ffosyw4rJbHisohyQk2vnh+c18qJF6FbLSv
 MXQmlcL8anARYJJhgtLtchlv8f3xuO92Wet+JMzyWRmFujgmGfu9hDnG9JSm2mzme9h4
 UP0d2rBNSlcoJj18yHTM0TPNBRtJW1+qwPx+jPeaKAVrEL0ypfSmdpfWEuPXQ1S9ZAlf
 ViyIBCj3yffD4E+fofUcm4N5TT1IZkUtBytPpu8B0pilbx4nnqlvXAIoV7GaoKG0AEzI
 v2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivphs1bWTObb7J+zazB6Vb2JyrITy24SYHszLm1C3fk=;
 b=NiAph9dLHCgM+sQ+0jwjqUlRA1WqnWb1sQpKCBvFhd8WJUUOJuBOV9zmHI+PL/6DfR
 o3YaI70LFFp+EizITjhaqQqeYg9jyQhRbk4n6Alfss0/LkDD073sGhZo/rXkM3+rqFrR
 R78+0wCkc/LHsl9/3iPQ3vmpciGM0etY0zWsF3K4j4DsLI9GqGLcKiJItMVsKrnx7tow
 Y/gVujPXGx/78ENIAT5x144vcu3S9nG9cKTAvGoyVw1JpMozg5vLXaDEgzyxWlJpgyv4
 Ad7vgnpp7b7GfPT/EMrHvfKiAPtD26IGwhSS/k8HVoqiPZH+DL6YBfo8TkKlk+ab7LMR
 CQyg==
X-Gm-Message-State: APjAAAWlOLB9brzBcftG/GtPg4SHY+WQBrJTxVhJ0wz1b8/XWkdiYZA4
 xqX4u4RNlTEWItPXEkvg2KN58GEkX74nD1qC9TU=
X-Google-Smtp-Source: APXvYqwoxMnR9MoGTLt5bQcblaue32BSzG0ctoryOAzSExLIflg+LUZ/9Tv0TUpYYUPaTTA8Z31mtAw5V1UGhgm2CC4=
X-Received: by 2002:a9d:da2:: with SMTP id 31mr7884660ots.319.1579715136313;
 Wed, 22 Jan 2020 09:45:36 -0800 (PST)
MIME-Version: 1.0
References: <20191218043951.10534-1-xiyou.wangcong@gmail.com>
 <20191218043951.10534-3-xiyou.wangcong@gmail.com>
 <8ce2f5b6-74e1-9a74-fd80-9ad688beb9b2@arm.com>
 <CAM_iQpXbjf8MuL17kZhxawXYBJm6t5-ho77F_VWR30L-9FS4Kg@mail.gmail.com>
 <e8789016-858a-b354-aa98-637e1d453fc3@arm.com>
In-Reply-To: <e8789016-858a-b354-aa98-637e1d453fc3@arm.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Wed, 22 Jan 2020 09:45:25 -0800
Message-ID: <CAM_iQpWM52sPfwWQPqZ-Fd_w8MgnN14WOK5gJAi3JCg1AwQGCw@mail.gmail.com>
Subject: Re: [Patch v3 2/3] iommu: optimize iova_magazine_free_pfns()
To: Robin Murphy <robin.murphy@arm.com>
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

On Wed, Jan 22, 2020 at 9:34 AM Robin Murphy <robin.murphy@arm.com> wrote:
> Sorry, but without convincing evidence, this change just looks like
> churn for the sake of it.

The time I wasted on arguing with you isn't worth anything than
the value this patch brings. So let's just drop it to save some
time.

Thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
